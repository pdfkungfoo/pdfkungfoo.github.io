---
title: "Typografie-Testseite für Code-Blöcke"
layout: default
created: 2025-04-01T12:22:59+02:00
createdlink: 3da4e64
lastmod: 2025-04-01T13:12:05+02:00
commitlink: 30f927b
publish: true
---

## Font-Test für Codeblöcke

Vergleich verschiedener Schriftarten nebeneinander –  
wenn alles klappt, sollte ich klare Unterschiede sehen:


<pre style="font-family: 'M PLUS 1m', monospace; background:#f7f7f7; padding:1em;">
M+ 1m:
for i in range(10):
    print("Hello World")
</pre>

<pre style="font-family: 'Courier New', monospace; background:#f7f7f7; padding:1em;">
Courier New:
for i in range(10):
    print("Hello World")
</pre>

<pre style="font-family: monospace; background:#f7f7f7; padding:1em;">
System default monospace:
for i in range(10):
    print("Hello World")
</pre>

###  Ziel:

Wenn nur der erste Block (M+ 1m) enger und eleganter aussieht → ✔️ funktioniert wie ich beabsichtige

Wenn alle gleich aussehen → ❗ Font wird nicht geladen → muss prüfen @import, Cache oder CSP
