---
title: Obduktionsbericht zu Raspberry Pi 3
layout: default
created: Tue Apr 1 11:50:56 2025 +0200
createdlink: https://github.com/pdfkungfoo/pdfkungfoo-seiten/commit/e3eee7a
lastmod: Tue Apr 1 11:50:56 2025 +0200
commitlink: https://github.com/pdfkungfoo/pdfkungfoo-seiten/commit/e3eee7a
---


# README: Obduktionsbericht zum ungeplanten Ausfall meines alt-ehrwürdigen Raspberry Pi 3

Dieses Dokument rekonstruiert die Ereignisse rund um den plötzlichen Ausfall eines Raspberry Pi 3.
Der fungiert als Brücke, DNS-Server/Ad-Blocker (Pi-hole) und NextCloud-Provider in einem Zwei-WLAN-Haus.

_(Der Raspi war nur scheintot; ich konnte ihn wiederbeleben, insofern ist das kein *wirklicher* Obduktionsbericht...)_

## Symptome

- Der Raspi reagierte nicht mehr auf Ping, SSH oder Dienste-Anfragen.
- Rote LED leuchtete dauerhaft.
- Grüne LED (Aktivitätsanzeige der SD-Karte) war dauerhaft aus.
- Keine kontrollierte Shutdown-Meldung sichtbar.
- Reboot wurde manuell per Stromtrennung ausgelöst.

## Analyse mittels `journalctl -b -1`

Die letzte sichtbare Aktivität im Systemjournal vor dem Absturz war:

~~~bash
Mar 31 17:39:30 wh18-raspi-1 systemd[1]: Finished phpsessionclean.service - Clean php session files.
~~~

Nach diesem Zeitpunkt: keine weiteren Logs.

## Startzeit laut `uptime -s`

~~~bash
2025-03-31 17:45:17
~~~

→ Das System war also zwischen 17:39:30 und 17:45:17 **nicht aktiv** und hat **keine Logeinträge produziert**.

## Weitere Erkenntnisse aus `last -x`

~~~bash
reboot   system boot  6.6.74+rpt-rpi-v Mon Mar 31 17:16   still running
kurtp    tty1                          Mon Mar 31 17:44   gone - no logout
runlevel (to lvl 5)                    Mon Mar 31 17:44   still running
~~~

→ `last` interpretiert den Reboot anhand der aktuellen Bootzeit – **nicht anhand eines Shutdowns**.
→ Das System wurde offenbar **hart ausgeschaltet**, vermutlich durch Stromverlust.

## Bewertung der LED-Anzeige beim Power-Reset

- **Rote LED** (PWR): dauerhaft an → Stromversorgung lag an.
- **Grüne LED** (ACT): aus → kein Zugriff auf SD-Karte → Kernel läuft nicht mehr.

Dies bestätigt einen **Hardlock oder Stromversorgungsproblem**, **nicht** einen normalen Shutdown.

## Mögliche Ursachen

- **Kurzzeitiger Stromabfall** (USB-Stecker, Überlastung)
- **Spannungseinbruch** bei gleichzeitiger Last
- **SD-Karte temporär nicht lesbar**
- **Thermischer Schutzmechanismus** (aber keine Throttle-/Temp-Warnungen in dmesg)

## Mögliche Empfehlungen

- **Stromversorgung stabilisieren** (Netzteil mit min. 5V / 2.5A)
- **`vcgencmd get_throttled`** regelmäßig prüfen
- Optional: **USV-Modul** (z. B. via GPIO)
- Mini-Watchdog-Skript zur Protokollierung von Temperatur, Spannung und IO-Zugriff

## Status nach Wiederinbetriebnahme

- SSH wieder stabil
- Dienste (Pi-hole, Nextcloud, Avahi) arbeiten korrekt
- Zeitbasierte Probleme auf Clientseite (Clock-Jumps) separat gelöst

Mal sehen, wie lange das jetzt hält...

## Siehe auch:

[README-time-flush-fix](#README-time-flush-fix) |
[vcgencmd](#vcgencmd) |
[Pi-hole](#Pi-hole) |
[Avahi](#Avahi) |
[Watchdog](#Watchdog) |
[Index](#Index) |


