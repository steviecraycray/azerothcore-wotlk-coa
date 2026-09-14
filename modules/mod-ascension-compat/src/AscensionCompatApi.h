/*
 * Schmale Schnittstelle auf den Klassendienst von mod-ascension-compat.
 *
 * WARUM: AscensionClassService ist in AscensionCompat.cpp definiert und von
 * aussen nicht erreichbar. Andere Module - konkret mod-playerbots - brauchen
 * genau eine seiner Faehigkeiten: einem Charakter eine Spezialisierung
 * zuweisen, damit die automatischen Talente und die gelehrten Faehigkeiten
 * vergeben werden.
 *
 * Diese Datei aendert KEIN Verhalten. Sie reicht einen bestehenden Aufruf
 * weiter, damit dafuer nicht die ganze Klasse in einen Header wandern muss.
 */

#ifndef ASCENSION_COMPAT_API_H
#define ASCENSION_COMPAT_API_H

#include <cstdint>

class Player;

namespace AscensionCompatApi
{
    // Setzt die Spezialisierung und vergibt die automatischen Eintraege nach.
    // Liefert false, wenn die Spezialisierung nicht zur Klasse gehoert oder
    // der Charakter keine CoA-Klasse ist.
    bool SwitchSpecialization(Player* player, std::uint32_t specializationId);

    // 0, wenn keine gesetzt ist.
    std::uint32_t GetActiveSpecialization(Player const* player);
}

#endif
