---
title: "Typografie-Testseite für Code-Blöcke"
layout: default
created: Tue Apr 1 12:22:59 2025 +0200
createdlink: https://github.com/pdfkungfoo/pdfkungfoo-seiten/commit/3da4e64
lastmod: Tue Apr 1 12:22:59 2025 +0200
commitlink: https://github.com/pdfkungfoo/pdfkungfoo-seiten/commit/3da4e64
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
