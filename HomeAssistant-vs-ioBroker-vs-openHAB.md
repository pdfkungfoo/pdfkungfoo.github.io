---
title: "Mein Vergleich: HomeAssistant vs. ioBroker vs. OpenHAB"
layout: default
created: Thu Apr 3 11:51:28 2025 +0200
createdlink: bac0bd2
lastmod: Thu Apr 3 11:51:28 2025 +0200
commitlink: bac0bd2
---




# 🧾 Mein Vergleich: Home Assistant vs. ioBroker vs. openHAB (Stand April 2025)

| Kriterium                               | 🏠 Home Assistant                       | 🔌 ioBroker                 | 🧱 openHAB                       |
|-----------------------------------------|-----------------------------------------|-----------------------------|----------------------------------|
| **Lizenz & Herkunft**                   | MIT / USA 🇺🇸                          | MIT / DE 🇩🇪               | EPL-2.0 / EU 🇪🇺                |
| **Hauptsprache/Technologie**            | Python + YAML                           | Node.js + JS                | Java + DSL                       |
| **Installation (Pi, Docker, VM)**       | Sehr einfach (Image, Docker)            | Einfach (Node.js nötig)     | Komplexer (Java + Konfig)        |
| **Web-Dashboard (UI)**                  | Lovelace, sehr modern                   | VIS, Jarvis, Material UI    | Basic UI + Custom (Main UI)      |
| **Automatisierung**                     | GUI + YAML + Scripts                    | Blockly + JS + Adapter      | Rule Engine (DSL/Blockly)        |
| **App-Verfügbarkeit**                   | ✅ Android & iOS                        | 🔶 Browser-basiert          | 🔶 Browser-basiert               |
| **Cloud nötig?**                        | ❌ Nein (lokal bevorzugt)               | ❌ Nein                     | ❌ Nein                          |
| **Zigbee-/Z-Wave-Unterstützung**        | ✅ via Integration/ZHA                  | ✅ via Adapter              | ✅ via Binding                   |
| **MQTT nativ**                          | ✅ Ja                                   | ✅ Ja                       | ✅ Ja                            |
| **Matter-Unterstützung**                | ✅ experimentell                        | 🔶 in Vorbereitung          | 🔶 teils experimentell           |
| **OTA für Geräte (ESP, Shelly etc.)**   | ✅ via ESPHome, MQTT                    | ✅ über Adapter möglich     | 🔶 teilweise über Add-ons        |
| **Visualisierung/Charts/Graphs**        | Gute Graphs + Add-ons                   | Umfangreich via VIS         | Basic Charts                     |
| **Skript-/Szenen-Unterstützung**        | Stark (YAML, Python, GUI)               | Sehr stark (JS, Blockly)    | Gut (Regeln, DSL, Scripts)       |
| **Benutzerverwaltung & Rechte**         | ✅ Integriert                           | 🔶 Grundlegend              | 🔶 Grundlegend                   |
| **Backup-Möglichkeiten**                | ✅ Snapshot-Backups                     | 🔶 Manuell + iobroker.js    | 🔶 Manuell (OpenHABian)          |
| **Community & Doku**                    | 🚀 Enorm aktiv & modern                 | 🤝 Aktiv, stark im DACH     | 📚 Gut, aber technischer         |
| **Add-ons & Erweiterbarkeit**           | HACS (riesig), Add-ons                  | Adapter-System (sehr offen) | Bindings + Scripting             |
| **Update-Frequenz**                     | Wöchentlich bis monatlich               | Regelmäßig                  | Selten & konservativ             |
| **Langlebigkeit / Zukunftsfähigkeit**   | 🌱 Sehr aktiv & modern                  | 🌱 Etabliert, aktiv         | 🟡 Stabile Basis, aber langsamer |
| **Steuerung per Touchscreen geeignet?** | ✅ hervorragend (Kiosk-Modus, Lovelace) | ✅ gut (VIS)                | 🔶 eingeschränkt (UI altmodisch) |

---

## 🧠 Bewertung aus meiner Perspektive (Stand heute)

| Anforderung                         | Empfehlung                                   |
|-------------------------------------|----------------------------------------------|
| Dashboard für Pi + Touchscreen      | **Home Assistant** → Lovelace-UI ist optimal |
| Nerdtaugliches Basteln mit Skripten | **ioBroker** → Adaptersystem & Blockly/JS    |
| Zukunftssichere Plattform           | **Home Assistant** (sehr aktiv)              |
| Lokale Steuerung ohne Cloud         | Alle drei Systeme                            |
| Deutsche Community + Forum          | **ioBroker**, gefolgt von openHAB            |
| Dokumentation + Tutorials           | **Home Assistant**, dann ioBroker            |
| Wenig Aufwand bei Erstkonfiguration | **Home Assistant** (mit Assistenten)         |

---

# 💬 Mein Fazit in einem Satz pro System:

- **Home Assistant** ist modern, aktiv, schnell eingerichtet und extrem flexibel – *derzeit die beste Wahl für Neueinsteiger und Fortgeschrittene*.
- **ioBroker** ist ideal für Bastler, Visualisierer und skriptfreudige Tüftler – *ein Schweizer Taschenmesser mit hoher Lernkurve*.
- **openHAB** ist solide, stabil und konservativ – *ideal für Nutzer mit Java-Erfahrung oder langjährigen Setups*.

---

# Hinweis: Überprüfung durch KI-Models

- Ich werde diesen Text mehreren KIs vorlegen und prüfen lassen.
- Sobald ich damit durch bin, werden deren Kommentare hier unten noch verlinkt

---


