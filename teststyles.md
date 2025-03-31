## Font-Test für Codeblöcke

Vergleich verschiedener Schriftarten nebeneinander –  
wenn alles klappt, sollte ich klare Unterschiede sehen:

```html
<pre style="font-family: 'M PLUS 1m', monospace;">
M+ 1m:
for i in range(10):
    print("Hello World")
</pre>

<pre style="font-family: 'Courier New', monospace;">
Courier New:
for i in range(10):
    print("Hello World")
</pre>

<pre style="font-family: monospace;">
System default monospace:
for i in range(10):
    print("Hello World")
</pre>
```

###  Ziel:

Wenn nur der erste Block (M+ 1m) enger und eleganter aussieht → ✔️ funktioniert wie ich beabsichtige

Wenn alle gleich aussehen → ❗ Font wird nicht geladen → muss prüfen @import, Cache oder CSP
