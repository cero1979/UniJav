(TeX-add-style-hook
 "univsci"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("polyglossia" "luatexrenderer=Node") ("inputenc" "utf8") ("fontenc" "T1") ("babel" "english") ("unicode-math" "warnings-off={mathtools-colon,mathtools-overbracket}") ("biblatex" "sorting=none" "abbreviate=false" "giveninits=true" "terseinits=true" "maxbibnames=99" "sortcites=true" "citestyle=numeric-comp") ("xcolor" "table" "cmky" "RGB") ("geometry" "heightrounded" "head=40.8pt" "top=24mm" "left=60mm" "right=9mm" "bottom=22mm" "marginparwidth=4.6cm" "marginparsep=5mm") ("subcaption" "font=small" "labelformat=parens" "labelsep=space") ("microtype" "tracking=smallcaps") ("mdframed" "framemethod=tikz") ("tcolorbox" "breakable" "skins") ("hyperref" "hidelinks") ("scrlayer-scrpage" "automark" "headsepline" "footsepline" "		headwidth=textwithmarginpar:-\\the\\marginparwidth-\\the\\marginparsep:marginpar" "		footwidth=textwithmarginpar:-\\the\\marginparwidth-\\the\\marginparsep:marginpar" "		")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "iftex"
    "ifxetex"
    "ifluatex"
    "polyglossia"
    "fontspec"
    "inputenc"
    "fontenc"
    "babel"
    "newtxtext"
    "inconsolata"
    "kvoptions"
    "article"
    "art10"
    "amssymb"
    "mathtools"
    "amsmath"
    "unicode-math"
    "stix"
    "biblatex"
    "color"
    "xcolor"
    "geometry"
    "amsthm"
    "anyfontsize"
    "subcaption"
    "framed"
    "graphicx"
    "hyphenat"
    "microtype"
    "mdframed"
    "colortbl"
    "booktabs"
    "array"
    "titling"
    "changepage"
    "authblk"
    "floatrow"
    "letltxmacro"
    "tcolorbox"
    "hyperref"
    "etoolbox"
    "tikz"
    "ragged2e"
    "scrlayer-scrpage"
    "scrlayer-notecolumn"
    "varwidth"
    "xparse"
    "xstring"
    "pageslts"
    "titlesec"
    "parskip"
    "chngcntr")
   (TeX-add-symbols
    '("parens" 1)
    '("storeauthorname" 1)
    '("captionbackgroundcolor" 1)
    '("keywords" 1)
    '("Affil" 2)
    '("AddToListOfContacts" 1)
    '("ShowContact" 1)
    "firstboldautoref"
    "listcontacts"
    "showauthorlist"
    "ABAuthorNames"
    "editor"
    "editormail"
    "authormail"
    "funding"
    "esmaterial"
    "issue"
    "vol"
    "doi"
    "shorttitle"
    "shortauthor"
    "oldsubfigure")
   (LaTeX-add-environments
    "titletext")
   (LaTeX-add-polyglossia-langs
    '("english" "defaultlanguage" ""))
   (LaTeX-add-xcolor-definecolors
    "shadecolor"
    "gray1"
    "gray2"
    "mytitlecolor"
    "myseccolor"
    "cpbgcol")
   (LaTeX-add-amsthm-newtheorems
    "lemma"
    "theorem"
    "corollary"
    "proposition"
    "example"
    "definition"
    "remark")
   (LaTeX-add-caption-DeclareCaptions
    '("\\DeclareCaptionFormat{overlay}" "Format" "overlay")))
 :latex)

