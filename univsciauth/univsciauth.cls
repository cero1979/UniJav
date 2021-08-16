% Provides univsci class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{univsciauth}[2021/04/25 Article class for Universitas Scientiarum]

\RequirePackage{iftex,ifxetex,ifluatex}

\newif\ifxetexorluatex
\ifxetex
    \xetexorluatextrue
\else
    \ifluatex
        \xetexorluatextrue
    \else
        \xetexorluatexfalse
    \fi
\fi

% Fonts and language settings
\ifxetexorluatex
    \renewcommand{\normalsize}{\fontsize{9}{10}\selectfont}

    \RequirePackage[luatexrenderer=Node]{polyglossia} % for language settings
    \setdefaultlanguage{english}

    \RequirePackage{fontspec} % for fonts selection

    \defaultfontfeatures[\rmfamily,\sffamily]{Ligatures=TeX}
    \setmainfont{TeXGyreTermesX}[
    Extension = .otf,
    UprightFont = *-Regular,
    BoldFont = *-Bold,
    ItalicFont = *-Italic,
    BoldItalicFont = *-BoldItalic]
    \setsansfont{LibertinusSans}[
    UprightFont = *-Regular,
    BoldFont = *-Bold,
    ItalicFont = *-Italic,
    Extension = .otf]
    \setmonofont{inconsolata}
\else
    \RequirePackage[utf8]{inputenc}
    \RequirePackage[T1]{fontenc}
    \renewcommand{\normalsize}{\fontsize{9}{10}\selectfont}

    \RequirePackage[english]{babel} % for language settings

    \RequirePackage{newtxtext} % standard times font
    \RequirePackage{inconsolata}

    \DeclareUnicodeCharacter{202F}{\,}
\fi

% Class based on standard article class
\RequirePackage{kvoptions}

\DeclareStringOption[11pt]{fntsize}
\ProcessKeyvalOptions{univsciauth}\relax
\PassOptionsToClass{\univsciauth@fntsize}{article}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% Mathematical fonts setup
\newif\if@mathsfonts\@mathsfontsfalse

\SetupKeyvalOptions{family=MO,prefix=MO@}
\DeclareBoolOption[true]{defaultmaths}

\ProcessKeyvalOptions*

\ifMO@defaultmaths
	\ifxetexorluatex
		\RequirePackage{amssymb}
		\RequirePackage{mathtools}
		\RequirePackage{amsmath}
		\RequirePackage[warnings-off={mathtools-colon,mathtools-overbracket}]{unicode-math}

		\setmathfont{XITSMath-Regular}[
		Extension = .otf,
		BoldFont = XITSMath-Bold]
	\else
		\RequirePackage{amssymb}
		\RequirePackage{mathtools}
		\RequirePackage{amsmath}
		\RequirePackage{stix}
	\fi
\else
	\RequirePackage{amssymb}
	\RequirePackage{mathtools}
	\RequirePackage{amsmath}
\fi

% Bibliography style
\newif\if@autobib\@autobibfalse

\DeclareOption{automatic-bibliography}{%
  \@autobibtrue}

\DeclareOption*{}
\ProcessOptions\relax

\if@autobib
	\RequirePackage[sorting=none, abbreviate=false, giveninits=true, terseinits=true, maxbibnames=99, sortcites=true, citestyle=numeric-comp]{biblatex}

	\renewbibmacro{in:}{}
	\setlength{\bibitemsep}{5pt}
	\setlength{\biblabelsep}{4pt}

	\renewcommand*{\revsdnamepunct}{}
	\renewcommand*{\bibpagespunct}{\addcolon}

	\DeclareFieldFormat[article, inproceedings, book]{title}{#1}
	\DeclareFieldFormat{pages}{\,#1,}
	\DeclareFieldFormat{journaltitle}{\textit{#1}.}
	\DeclareFieldFormat[inproceedings, book]{volume}{#1}
	\DeclareFieldFormat{doi}{\vspace{5pt}\par
	\textrm{doi}\addcolon\space\ifhyperref
	{\href{http://dx.doi.org/#1}{\nolinkurl{#1}}}{\nolinkurl{#1}}}
	\DeclareFieldFormat{url}{\textrm{url}\addcolon\space\ifhyperref
	{\href{#1}{\nolinkurl{#1}}}{\nolinkurl{#1}}}

	\DeclareNameAlias{default}{family-given}
	\renewcommand{\UrlFont}{\normalfont}

	\newtoggle{bbx:datemissing}
	\renewbibmacro*{date}{\toggletrue{bbx:datemissing}}
	\renewbibmacro*{issue+date}{\toggletrue{bbx:datemissing}\iffieldundef{issue}{}
	{\printtext[parens]{\printfield{issue}}}\newunit}
	\newbibmacro*{date:print}{\togglefalse{bbx:datemissing}\printdate}
	\renewbibmacro*{chapter+pages}{\printfield{chapter}
	\setunit{\bibpagespunct}\printfield{pages}\newunit
	\usebibmacro{date:print}\newunit}
	\renewbibmacro*{note+pages}{\printfield{note}\setunit{\bibpagespunct}
	\printfield{pages}\newunit\usebibmacro{date:print}\newunit}
	\renewbibmacro*{addendum+pubstate}{\iftoggle{bbx:datemissing}
	{\usebibmacro{date:print}}{}\printfield{addendum}\newunit\newblock\printfield{pubstate}}
\fi

% Define colors
\RequirePackage{color}
\RequirePackage[table,cmky,RGB]{xcolor}

\definecolor{shadecolor}{gray}{0.9}
\definecolor{gray1}{gray}{0.90}
\definecolor{gray2}{gray}{0.85}
\definecolor{mytitlecolor}{RGB}{0,64,109}
\definecolor{myseccolor}{RGB}{0,64,109}

\RequirePackage[heightrounded, head=40.8pt, top=24mm, left=60mm, right=9mm, bottom=22mm, marginparwidth=4.6cm, marginparsep=5mm]{geometry}

\RequirePackage{amsthm}
\RequirePackage{anyfontsize}
\RequirePackage[font=small,labelformat=parens,labelsep=space]{subcaption}
\RequirePackage{framed}
\RequirePackage{graphicx}
\RequirePackage{hyphenat}
\RequirePackage{mathtools}
\RequirePackage[tracking=smallcaps]{microtype}
\RequirePackage[framemethod=tikz]{mdframed}

% Theorems
\numberwithin{equation}{section}

\newtheorem{lemma}{Lemma}[section]
\theoremstyle{definition}
\newtheorem{theorem}[lemma]{Theorem}
\theoremstyle{definition}
\newtheorem{corollary}[lemma]{Corollary}
\theoremstyle{definition}
\newtheorem{proposition}[lemma]{Proposition}
\theoremstyle{definition}
\newtheorem{example}[lemma]{Example}
\theoremstyle{definition}
\newtheorem{definition}[lemma]{Definition}
\theoremstyle{definition}
\newtheorem{remark}[lemma]{Remark}
\theoremstyle{definition}

\begingroup
\makeatletter
\@for\theoremstyle:=definition,remark,plain\do{
\expandafter\g@addto@macro\csname th@\theoremstyle\endcsname{
\addtolength\thm@preskip\parskip}}
\endgroup

% Settings for tables
\RequirePackage{colortbl}
\RequirePackage{booktabs}
\RequirePackage{array}

% Modify article maketitle defaults
\RequirePackage{titling}
\RequirePackage{changepage}

\newenvironment{titletext}{\color{mytitlecolor}}

\pretitle{\begin{adjustwidth}{-51mm}{0mm}\begin{center}\bfseries\fontsize{22}{24}\selectfont\begin{titletext}}
\posttitle{\end{titletext}\end{center}\end{adjustwidth}\vspace{10bp}}
\preauthor{\begin{adjustwidth}{-51mm}{0mm}\begin{center}\bfseries\fontsize{14}{15}\selectfont}
\postauthor{\par\end{center}\end{adjustwidth}}
\date{\vspace{-5ex}}

% Modify author info
\RequirePackage{authblk}
\RequirePackage{floatrow}

\AtBeginDocument{\affil[ ]{\mbox{ }}}
\setcounter{Maxaffil}{0}
\renewcommand\Authfont{\bfseries}
\renewcommand\Affilfont{\normalfont\footnotesize}
\renewcommand\Authsep{, }
\renewcommand\Authand{, }
\renewcommand\Authands{, }

% Define abstract environment & keywords & side data & caption
\usepackage{letltxmacro}
\RequirePackage[breakable, skins]{tcolorbox}
\RequirePackage[hidelinks]{hyperref}
\urlstyle{rm}
\RequirePackage{graphicx}
\RequirePackage{etoolbox}

% Special reference format (make the first instance of any cross-reference boldface)
\AtBeginDocument{%
  \LetLtxMacro\hyperrefautoref\autoref
  \LetLtxMacro\autoref\firstboldautoref
}
\makeatletter
\DeclareRobustCommand\firstboldautoref{\@firstboldautoref}
\def\@firstboldautoref#1#{%
  \def\fb@autoref@star{#1}%
  \fb@autoref
}
\def\fb@autoref#1{%
  \ifcsname boldautoref@#1\endcsname
    \expandafter\hyperrefautoref\fb@autoref@star{#1}%
  \else
    \global\expandafter\let\csname boldautoref@#1\endcsname\@empty
    \textbf{\expandafter\hyperrefautoref\fb@autoref@star{#1}}%
  \fi
}
\makeatother

% TikZ stuff
\RequirePackage{tikz}
\usetikzlibrary{calc}
\usetikzlibrary{intersections,decorations.text,shapes.misc}

% Authors information
\makeatletter

\newtoggle{@IsFirstEntryInList}

\newcommand*{\@ShowContact}[1]{%
    \iftoggle{@IsFirstEntryInList}{%
        \global\togglefalse{@IsFirstEntryInList}%
    }{%
        \medskip % separator between entries
    }%
    \ShowContact{#1}%
}
\newcommand*{\ShowContact}[1]{%
    \par\noindent\textbf{\csuse{number #1}}%
    . \noindent\textrm{\csuse{univ #1}}%
}%

%% https://tex.stackexchange.com/a/14394/4301
\newcommand*{\listcontacts}{% Initialize
    \global\toggletrue{@IsFirstEntryInList}%
}
\newcommand{\AddToListOfContacts}[1]{%
    \g@addto@macro\listcontacts{{#1}}%
}

\newcommand{\Affil}[2]{%
    \ifcsdef{name #1}{%
        \PackageError{\jobname}{Multiple uses of the key: '#1'}{}%
    }{%
        \csdef{number #1}{#1}%
        \csdef{univ #1}{#2}%
        \AddToListOfContacts{\unexpanded{\@ShowContact{#1}}\par}%
    }%
}

\def\editor#1{\gdef\@editor{#1}}
\appendiargdef{\editor}{\protected@xdef\editor{#1}}

\def\editormail#1{\gdef\@editormail{#1}}
\appendiargdef{\editormail}{\protected@xdef\editormail{#1}}

\def\authormail#1{\gdef\@authormail{#1}}
\appendiargdef{\authormail}{\protected@xdef\authormail{#1}}

\def\funding#1{\gdef\@funding{#1}}
\appendiargdef{\funding}{\protected@xdef\funding{#1}}

\def\esmaterial#1{\gdef\@esmaterial{#1}}
\appendiargdef{\esmaterial}{\protected@xdef\esmaterial{#1}}

\makeatother

\RequirePackage{ragged2e}
\reversemarginpar % Essential to put notes on the right margin
\RequirePackage[automark, headsepline, footsepline,
		headwidth=textwithmarginpar:-\the\marginparwidth-\the\marginparsep:marginpar,
		footwidth=textwithmarginpar:-\the\marginparwidth-\the\marginparsep:marginpar,
		]{scrlayer-scrpage}
\setlength{\footheight}{25.14255pt}

\RequirePackage{scrlayer-notecolumn}
\setkomafont{notecolumn.marginpar}{\footnotesize\raggedright}

\renewenvironment{abstract}{
	\begin{tcolorbox}[blanker]
	\makenote*{
		{\fontsize{8}{9}\selectfont\textbf{Edited by}
			\par
			\noindent\editor\par
			\noindent\href{mailto:\editormail}{\editormail}\par
			\vspace{4mm}\par
			\listcontacts\par
			\medskip
			*\href{mailto:\authormail}{\authormail}\par
			\vspace{4mm}\par
			\textbf{Funding:} \funding\par
			\vspace{4mm}\par
			\textbf{Electronic supplementary material:} \esmaterial\par
			\hspace{10mm}
			\includegraphics[width=24mm]{icons/Open_Access_PLoS}}
		}
	\end{tcolorbox}
	\vspace*{-0.5cm}\small\begin{shaded*}
	{\fontsize{11}{10}\selectfont\noindent\textbf{\textcolor{myseccolor}{Abstract}}}
	\par}
{\par\end{shaded*}
\smallskip}

\newcommand{\keywords}[1]{\vspace{5mm}\fontsize{11}{10}\selectfont
\noindent\textbf{\textcolor{myseccolor}{Keywords:}} {\small #1}}

% Special captions for figures and the like
\RequirePackage{varwidth}
\newcommand{\captionbackgroundcolor}[1]{\colorlet{cpbgcol}{#1}}
\captionbackgroundcolor{shadecolor}
\DeclareCaptionFormat{overlay}{\colorbox{cpbgcol}{\centering%
  \begin{varwidth}{\dimexpr\captionwidth-2\fboxsep-2\fboxrule}
	      #1#2#3
	        \end{varwidth}}}
\captionsetup{format=overlay,labelfont=bf,font=footnotesize,labelsep=period}

\floatsetup[table]{capposition=top}

\RequirePackage{xparse}
\RequirePackage{xstring}
\RequirePackage{etoolbox}
\RequirePackage{pageslts}
\pagenumbering{arabic}

\makeatletter
\def\issue#1{\gdef\@issue{#1}}
\appendiargdef{\issue}{
\protected@xdef\issue{#1}}

\def\vol#1{\gdef\@vol{#1}}
\appendiargdef{\vol}{
\protected@xdef\vol{#1}}

\def\doi#1{\gdef\@doi{#1}}
\appendiargdef{\doi}{
\protected@xdef\doi{#1}}

\def\shorttitle#1{\gdef\@shorttitle{#1}}
\appendiargdef{\shorttitle}{
\protected@xdef\shorttitle{#1}}

\def\shortauthor#1{\gdef\@shortauthor{#1}}
\appendiargdef{\shortauthor}{
\protected@xdef\shortauthor{#1}}

\ExplSyntaxOn
\clist_new:N \l_author_list
\newcommand{\storeauthorname}[1]{
\clist_put_right:Nn \l_author_list {#1}}
\newcommand{\showauthorlist}{
\clist_use:Nnnn \l_author_list {\,\&\,} {\,\&\,} {\,\&\,}}
\ExplSyntaxOff

\LetLtxMacro\AB@@author\author
\def\AB@authornames{}
\renewcommand{\author}[2][]{\AB@@author[#1]{#2}
\storeauthorname{#2}}

\newcommand{\ABAuthorNames}{\showauthorlist}
\makeatother

\setkomafont{pagenumber}{%
        \normalfont\rmfamily\bfseries
}

% Title page style
\newpairofpagestyles{firstpage}{%
\KOMAoptions{headsepline=0pt, footsepline=0pt}%
\setkomafont{pageheadfoot}{\normalfont\rmfamily}
\chead{
	\raisebox{-2.5cm}[0pt][0pt]{%
	\begin{tikzpicture}[remember picture]
		\node (logo) [inner sep=0pt] at (-8.8,-0.5) {\includegraphics[height=21mm]{icons/Javeriana}};
		\draw [black] (-9.6,-1.44) -- (-9.1,-1.44);
		\draw [thin, draw=mytitlecolor, fill=mytitlecolor] (6.2,-1.44) -- (10.2,-1.44) {[rounded corners=4pt] -- (10.2,-1.97) -- (6.2,-1.97)} -- cycle; 
		\node at (8.2,-1.44)[below] {\color{white} \textbf{\fontsize{10.5}{12}\selectfont ORIGINAL ARTICLE}};
		\node [align=right]at (8.2,-1.44)[above, xshift=-10mm, text width=60mm] {\shortstack[r]{\fontsize{9}{9.7}\selectfont Univ.Sci.: \pageref{pagesLTS.0}--\pageref{LastPage}, \the\year{} \\ \fontsize{9}{9.7}\selectfont doi:\doi}};
		\draw [black] (-8.48,-1.44) -- (10.2,-1.44);
	\end{tikzpicture}
	}
}
  \ifoot{%
	  \includegraphics[width=21mm]{icons/CC-BY_icon}
    }
  \ofoot{%
	  \fontsize{6.5}{8}\selectfont \textit{Universitas Scientiarum}, Journal of the Faculty of Sciences, Pontificia Universidad Javeriana, is licensed under the Creative Commons Attribution 4.0 International Public License
	  }
	  }

% Page styles for all but the first one
\clearpairofpagestyles
\ihead{\ifodd\value{page}\fontsize{9}{8}\selectfont \shortauthor \else\fontsize{9}{8}\selectfont \pagemark\fi}
\ohead{\ifodd\value{page}\fontsize{9}{8}\selectfont \pagemark \else\fontsize{9}{8}\selectfont \shorttitle\fi}

\ifoot{\fontsize{8}{8}\selectfont\textit{Universitas Scientiarum:\pageref{pagesLTS.0}--\pageref{LastPage}}}
\ofoot{\href{http://ciencias.javeriana.edu.co/investigacion/universitas-scientiarum}{\fontsize{8}{8}\selectfont\textit{http://ciencias.javeriana.edu.co/investigacion/universitas-scientiarum}}}

% Modify appearance of section titles
\RequirePackage{titlesec}

\titleformat{\section}
{\bfseries\fontsize{13}{12}\selectfont}{{\color{myseccolor}\thesection.}\hspace{3mm}}{0em}{\textcolor{myseccolor}}
\titlespacing{\section}{0pt}{8mm}{4mm}
\titlelabel{\thetitle.\quad}
\titleformat{\subsection}{\bfseries}{{\color{myseccolor}\thesubsection.}\hspace{3mm}}{0em}{\textcolor{myseccolor}}
\titlespacing{\subsection}{0pt}{4mm}{1em}

\titleformat{\subsubsection}{\itshape\bfseries}{{\color{myseccolor}\thesubsubsection.}\hspace{3mm}}{0em}{\textcolor{myseccolor}}
\titlespacing{\subsubsection}{0pt}{4mm}{1em}

% Some spacing adjustments
\RequirePackage{parskip}

\setlength{\parindent}{0mm}
\setlength{\parskip}{8pt}
\setlength{\columnsep}{10mm}
\widowpenalties 3 10000 10000 0
\clubpenalties 3 10000 10000 0

% Adjustments to produce line numbers in math
\RequirePackage{chngcntr}
\counterwithout{equation}{section} % remove section numbers

% Macro to redefine the style of subfigures
\newcommand{\parens}[1]{(#1)}
\let\oldsubfigure\thesubfigure
\renewcommand\thesubfigure{\parens{\oldsubfigure}}

% Default editor info.
\AtBeginDocument{
        \editor{Juan Carlos Salcedo-Reyes}
        \editormail{salcedo.juan@javeriana.edu.co}
}
