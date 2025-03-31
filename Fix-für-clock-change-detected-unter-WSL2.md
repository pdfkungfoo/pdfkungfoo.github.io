# Fix für wiederholte "Clock change detected"-Probleme unter WSL2

Dieses Dokument beschreibt die Ursache und Lösung für ein gravierendes Problem mit instabiler Systemzeit im *Windows Subsystem for Linux (WSL2)*.
Dieses führte zu ständigen DNS-Schluckaufs und instabilen SSH-Verbindungen zu meinem Raspi 3.

## Problem

Unter WSL2 auf einem älteren Lenovo-Laptop mit Windows 11 trat im 30-Sekundentakt folgender Logeintrag auf:

~~~bash
systemd-resolved[395]: Clock change detected. Flushing caches.
~~~

Sichtbar gemacht mittels:

~~~bash
kp@t480-kp:~$ journalctl|grep -i clock|tail -n 5
Mar 31 19:18:20 t480-kp systemd-resolved[395]: Clock change detected. Flushing caches.
Mar 31 19:18:50 t480-kp systemd-resolved[395]: Clock change detected. Flushing caches.
Mar 31 19:19:20 t480-kp systemd-resolved[395]: Clock change detected. Flushing caches.
Mar 31 19:19:50 t480-kp systemd-resolved[395]: Clock change detected. Flushing caches.
Mar 31 19:20:20 t480-kp systemd-resolved[395]: Clock change detected. Flushing caches.

kp@t480-kp:~$ journalctl|grep -i clock|wc -l
5173
~~~

Insgesamt mehr als 5.000-mal innerhalb von 2 Tagen!

Begleitend dazu kam es zu instabilen SSH-Verbindungen („broken pipe“) und häufigem Verlust der DNS-Auflösung.

## Ursache

- WSL2 übernimmt die Uhrzeit vom Windows-Host.
- Der Windows-Host hat jedoch selbst keine stabile Zeitsynchronisation (w32time nicht aktiv).
- Vermutlich greifen andere Windows-Dienste (z. B. Lenovo Vantage, Secure Boot, TPM, etc.) auf die Systemzeit zu und verursachen periodische Sprünge.
- Diese Sprünge werden innerhalb von WSL erkannt, führen zu DNS-Cache-Flushes und können SSH- oder TLS-Verbindungen stören.

## Fix

Statt `systemd-resolved` des WSL automatisch auf Clock-Jumps reagieren zu lassen, habe ich dieser Dienst deaktiviert und die DNS-Auflösung manuell auf stabile Server gesetzt:

1. **systemd-resolved deaktivieren:**

   ~~~bash
   sudo systemctl stop systemd-resolved
   sudo systemctl disable systemd-resolved
   ~~~

2. **automatisch generierte *resolv.conf* entfernen:**

   ~~~bash
   sudo rm /etc/resolv.conf
   ~~~

3. **statische resolv.conf mit Redundanz anlegen:**

   ~~~bash
   echo -e "nameserver 192.168.180.254\nnameserver 192.168.78.1\nnameserver 192.168.180.1\nnameserver 192.168.78.254" | sudo tee /etc/resolv.conf
   ~~~

4. **Verbindung testen:**

   ~~~bash
   ping -c 1 heise.de
   ~~~

Seit diesem Eingriff:

- keine Clock-Warnungen mehr im Journal
- stabile SSH-Sessions
- zuverlässige DNS-Auflösung

## Hinweise

- Bei mobilen Clients kann diese Liste sinnvoll erweitert werden um öffentliche DNS-Server (1.1.1.1 / 8.8.8.8), falls kein lokales Netz erreichbar ist.
- Alternativ kann `/etc/wsl.conf` konfiguriert werden, um `resolv.conf` dauerhaft vor automatischem Überschreiben zu schützen:

   ~~~ini
   [network]
   generateResolvConf = false
   ~~~
   
   Danach:
   
   ~~~powershell
   wsl.exe --shutdown
   ~~~

   Beim nächsten Start bleibt die manuell gesetzte `/etc/resolv.conf` erhalten.

## Siehe auch:

[README-mit-Obduktionsbericht](#README-mit-Obduktionsbericht) | [resolv.conf](#resolv.conf) | [Pi-hole](#Pi-hole) | [SSH](#SSH) | [systemd-resolved](#systemd-resolved) | [Index](#Index) |

---


