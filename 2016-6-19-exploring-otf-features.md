# Exploring OpenType Font (OTF) Features: Start

The recent conference [PDF Days Europe 2016](http://www.pdfa.org/event/pdf-days-europe-2016-in-berlin-june-14-15/) resparkled my interest in exploring the special features the OpenType Font (OTF) format offers.

A lot of these features are optional, and not many fonts make much use of them. I also recently learned that LaTeX (well, specifically: XeLaTeX and LuaLaTeX) can take advantage of OTF features if you know how.

So my first step was first of all to create a small local repository of text files which just enumerate the OTF features of each installed font on my machines. As a first step, I used ***`otfinfo -f somefile.otf`***. The `-f` (or `--feature`) parameter reports the list of built-in features of the respective file. The `otfinfo` utility itself is part of Eddie Kohler's great [*`lcdf-typetools`* package](http://www.lcdf.org/~eddietwo/type/#typetools), available for Linux, Mac OS X and Windows.

**Example:**

```
$> otfinfo -f ~/Library/Fonts/Hack-Regular.ttf

 aalt	Access All Alternates
 case	Case-Sensitive Forms
 frac	Fractions
 ordn	Ordinals
 sinf	Scientific Inferiors
 subs	Subscript
 sups	Superscript
```

For now I just made an inventory of the MacBook. It holds all fonts in `/Library/Fonts/` (system fonts) or `${HOME}/Library/Fonts/` (user installed fonts).

I ran this series of commands to create a simple text file per font, which holds a list similar to the above output for each OTF font file, indicating the full file path in the first line:

```
 $> mkdir ${HOME}/Library/Fonts/otf-features-of-my-fonts/
 $> cd /
 $> find /Library/Fonts ${HOME}/Library/Fonts -type f -name "*.otf" \
    |  while read path ; do
         echo "${path}"        > ${HOME}/Library/Fonts/otf-features-of-my-fonts/${ basename "${path}" ).txt
         otfinfo -f "${path}" >> ${HOME}/Library/Fonts/otf-features-of-my-fonts/${ basename "${path}" ).txt
       done
```

I was surprised to see that all faces of the *FiraSans* family (a set of fonts developed by The Mozilla Foundation in cooperation with Telefonica S.A.) do have 27 features each:

```
${HOME}/Library/Fonts/FiraSans-Regular.otf
aalt	Access All Alternates
c2sc	Small Capitals From Capitals
calt	Contextual Alternates
case	Case-Sensitive Forms
cpsp	Capital Spacing
dlig	Discretionary Ligatures
dnom	Denominators
frac	Fractions
kern	Kerning
liga	Standard Ligatures
lnum	Lining Figures
mark	Mark Positioning
mgrk	Mathematical Greek
mkmk	Mark to Mark Positioning
numr	Numerators
onum	Oldstyle Figures
ordn	Ordinals
pnum	Proportional Figures
salt	Stylistic Alternates
smcp	Small Capitals
ss01	Stylistic Set 1
ss02	Stylistic Set 2
ss03	Stylistic Set 3
subs	Subscript
sups	Superscript
tnum	Tabular Figures
zero	Slashed Zero
```


***Most*** features, 38 altogether are built into a font named *Kozuka Mincho Pr6N R*, sporting a wopping glyph count total of a 23058!

```
/Library/Fonts/KozMinPr6N-Regular.otf
aalt	Access All Alternates
afrc	Alternative Fractions
ccmp	Glyph Composition/Decomposition
dlig	Discretionary Ligatures
dnom	Denominators
expt	Expert Forms
frac	Fractions
fwid	Full Widths
halt	Alternate Half Widths
hkna	Horizontal Kana Alternates
hojo	Hojo Kanji Forms (JIS X 0212-1990 Kanji Forms)
hwid	Half Widths
ital	Italics
jp78	JIS78 Forms
jp83	JIS83 Forms
jp90	JIS90 Forms
kern	Kerning
liga	Standard Ligatures
nalt	Alternate Annotation Forms
nlck	NLC Kanji Forms
numr	Numerators
palt	Proportional Alternate Widths
pkna	Proportional Kana
pwid	Proportional Widths
qwid	Quarter Widths
ruby	Ruby Notation Forms
sinf	Scientific Inferiors
subs	Subscript
sups	Superscript
trad	Traditional Forms
twid	Third Widths
vert	Vertical Writing
vhal	Alternate Vertical Half Metrics
vkna	Vertical Kana Alternates
vkrn	Vertical Kerning
vpal	Proportional Alternate Vertical Metrics
vrt2	Vertical Alternates and Rotation
zero	Slashed Zero
```

Don't ask me what each and every one of these features means. I'm only at the start of my journey exploring these. The only thing I know right now is that for each feature the font holds a table (conveniently named with four charactes each) describing the feature. The only features I hope to roughly know what they mean are `aalt`, `dlig`, `frac`, `kern`, `liga`, `subs`, `sups` and `zero`.

<!--
2016-6-19-exploring-otf-features.md
-->
