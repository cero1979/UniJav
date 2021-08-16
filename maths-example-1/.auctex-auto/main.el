(TeX-add-style-hook
 "main"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("univsci" "automatic-bibliography" "defaultmaths=false")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("mtpro2" "lite" "subscriptcorrection" "nofontinfo")))
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
    "univsci"
    "univsci10"
    "multirow"
    "longtable"
    "siunitx"
    "mtpro2")
   (LaTeX-add-labels
    "eqn111"
    "sec2"
    "r1"
    "eq1"
    "4_2"
    "5_2"
    "2.1_1"
    "sec3"
    "d2"
    "p4"
    "deg1sys"
    "fig1"
    "fig2"
    "fig:4a"
    "fig:4b"
    "p7"
    "4_1"
    "5_1"
    "2.1"
    "eqn21"
    "eqn1'"
    "eqn10"
    "7"
    "sec4"
    "p8"
    "c1"
    "2"
    "sec5"
    "1"
    "e2"
    "fig3"
    "fig:7a"
    "fig:7b"
    "fig5"
    "e1"
    "fig7"
    "fig:9a"
    "fig:9b"
    "fig51"
    "sec6")
   (LaTeX-add-bibliographies
    "references"))
 :latex)

