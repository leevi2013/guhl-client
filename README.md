# Ragzan Utility — Fabric 1.21.11

Ein clientseitiges Fabric-Mod-Projekt mit einem zentralen Menü auf **I**.

## Funktionen

- **Player ESP:** Umrandungen für nahe Spieler, auch wenn sie hinter Blöcken stehen. Reichweite, Farbe und Stärke sind einstellbar.
- **Block ESP:** Liste aller aktuell im Spiel registrierten Blöcke (einschließlich Blöcken anderer installierter Mods); jede Art lässt sich einzeln auswählen. Farbe und Stärke sind einstellbar.
- **Stash ESP:** Markiert ausgewählte Lager-/Containerblöcke innerhalb des lokalen Scanbereichs. Standardmäßig sind unter anderem Kisten, Fässer, Hopper, Shulkerboxen, Öfen, Spender und Dropper gewählt. Eine Benachrichtigung erscheint bei 4 oder mehr verbundenen Lagerblöcken oder bei benachbarten Lagerblöcken.
- **Auto-Reconnect:** Kann auf einem Multiplayer-Server bei Y ≤ -25 (oder einer anderen eingestellten Höhe) trennen und anschließend erneut verbinden.
- **Freecam Mining:** Clientseitige Freecam mit WASD, Leertaste zum Hochfliegen, Shift zum Sinken und Sprint für schnellere Bewegung. Die Spielfigur bleibt währenddessen stehen. Ein frei belegbarer Hotkey schaltet die Freecam um; beim Blick auf einen erreichbaren Block wird der Abbau automatisch versucht.

## Bedienung

1. Mod in einen Fabric-Client für Minecraft Java **1.21.11** installieren und mit Fabric API starten.
2. Im Spiel **I** drücken, um das Menü zu öffnen oder zu schließen.
3. **Linksklick** auf ein Modul schaltet es an/aus.
4. **Rechtsklick** auf ein Modul öffnet dessen Einstellungen.
5. In Block ESP oder Stash ESP die Blockliste öffnen und die gewünschten Blockarten auswählen. Die Auswahl wird gespeichert.
6. Bei Freecam Mining in den Einstellungen einen Hotkey setzen. Danach das Modul einschalten und diesen Hotkey drücken.

Einstellungen werden in `config/ragzan-utility.properties` gespeichert.

## Voraussetzungen

- Minecraft Java Edition **1.21.11**
- Java **21**
- Fabric Loader **0.18.1 oder neuer**
- Fabric API passend zu Minecraft 1.21.11 (Projekt ist auf `0.141.3+1.21.11` eingestellt)
- Gradle **9.2 oder neuer** zum Bauen

## Mit GitHub bauen (empfohlen)

1. Entpacke die ZIP-Datei auf deinem PC.
2. Öffne den Ordner `RagzanUtility` und lade **dessen gesamten Inhalt** in das Hauptverzeichnis eines neuen GitHub-Repositories hoch. Wichtig: `.github/workflows/build.yml` muss dann direkt im Repository liegen.
3. Öffne im GitHub-Repository den Tab **Actions**. Beim Push startet der Build automatisch. Du kannst ihn auch über **Actions → Build Fabric Mod → Run workflow** manuell starten.
4. Warte, bis der Workflow grün ist, öffne den erfolgreichen Lauf und lade unter **Artifacts** `ragzan-utility-minecraft-1.21.11` herunter. In diesem ZIP liegt die gebaute `.jar`.

## Lokal bauen

Im Projektordner ausführen:

```bash
gradle build
```

Die Mod-JAR wird bei erfolgreichem Build in `build/libs/` erzeugt. Alternativ den Projektordner in IntelliJ IDEA als Gradle-Projekt öffnen und `build` ausführen. Die Java-Dateien liegen unter `src/main/java`.

## Wichtige technische Grenzen

Dies ist ein **Quellprojekt**, keine lokal geprüfte fertige JAR: Die Build-Umgebung dieser Sitzung hat Gradle und keinen Netzwerkzugriff zum Herunterladen der Minecraft-/Fabric-Abhängigkeiten. Der Build muss daher bei dir mit Gradle ausgeführt werden.

ESP-Scans laufen nur über bereits geladene Chunks im eingestellten Scanbereich; nicht geladene oder weit entfernte Bereiche sind nicht sichtbar. Freecam bewegt die Kamera clientseitig. Der echte Server prüft Blockabbau weiterhin auf Reichweite und Berechtigungen; ein normaler Client kann diese serverseitigen Regeln nicht zuverlässig übergehen. Die Nutzung von ESP kann auf Multiplayer-Servern gegen deren Regeln verstoßen.
