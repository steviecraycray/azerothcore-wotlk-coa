/*
 * Copyright (C) 2016+ AzerothCore <www.azerothcore.org>, released under GNU AGPL v3 license: https://github.com/azerothcore/azerothcore-wotlk/blob/master/LICENSE-AGPL3
 */

#include "AllMapScript.h"
#include "DungeonHealth.h"
#include "GlobalScript.h"
#include "Item.h"
#include "ItemScript.h"
#include "LootMgr.h"
#include "Map.h"
#include "ObjectMgr.h"
#include "Player.h"
#include <algorithm>
#include <mutex>
#include <set>
#include <unordered_map>

namespace
{
    constexpr uint32 MarkOfTriumph = 1414502;

    std::mutex CreditedLock;
    std::unordered_map<uint32, std::set<uint32>> Credited;
}

class item_coa_dungeon_spoils final : public ItemScript
{
public:
    item_coa_dungeon_spoils() : ItemScript("item_coa_dungeon_spoils") { }

    bool OnUse(Player* player, Item* item, SpellCastTargets const&) override
    {
        if (!player->IsAlive() || player->IsInCombat() || !item->GetTemplate()->HasFlag(ITEM_FLAG_HAS_LOOT))
            return false;
        player->SendLoot(item->GetGUID(), LOOT_CORPSE);
        return true;
    }
};

class CoADungeonBossMarks final : public GlobalScript
{
public:
    CoADungeonBossMarks() : GlobalScript("CoADungeonBossMarks", { GLOBALHOOK_ON_AFTER_UPDATE_ENCOUNTER_STATE }) { }

    void OnAfterUpdateEncounterState(Map* map, EncounterCreditType type, uint32 creditEntry, Unit*, Difficulty,
        std::list<DungeonEncounter const*> const* encounters, uint32 dungeonCompleted, bool) override
    {
        if (!map || !encounters || !map->IsNonRaidDungeon() || !DungeonHealth::IsVanillaDungeon(map->GetId()))
            return;
        if (map->GetSpawnMode() != 1 && map->GetSpawnMode() != 2)
            return;
        bool const boss = std::any_of(encounters->begin(), encounters->end(), [type, creditEntry](DungeonEncounter const* encounter)
        {
            return encounter->creditType == type && encounter->creditEntry == creditEntry;
        });
        if (!boss)
            return;
        {
            std::lock_guard<std::mutex> guard(CreditedLock);
            if (!Credited[map->GetInstanceId()].insert(creditEntry).second)
                return;
        }
        uint32 const marks = dungeonCompleted ? 2 : 1;
        map->DoForAllPlayers([marks](Player* player) { player->AddItem(MarkOfTriumph, marks); });
    }
};

class CoADungeonBossMarkInstances final : public AllMapScript
{
public:
    CoADungeonBossMarkInstances() : AllMapScript("CoADungeonBossMarkInstances", { ALLMAPHOOK_ON_DESTROY_INSTANCE }) { }

    void OnDestroyInstance(MapInstanced*, Map* map) override
    {
        std::lock_guard<std::mutex> guard(CreditedLock);
        Credited.erase(map->GetInstanceId());
    }
};

void AddSC_CoADungeonSpoils()
{
    new item_coa_dungeon_spoils();
    new CoADungeonBossMarks();
    new CoADungeonBossMarkInstances();
}
