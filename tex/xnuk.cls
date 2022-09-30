%! TeX program = XeLaTeX
%! TeX encoding = UTF-8
\nonstopmode

\RequirePackage{iftex}
\RequireXeTeX

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{xnuk}[my dick is great]

\newcommand{\XnukTitle}[1]{\title{#1}}
\newcommand{\XnukFancy}{%
	\pagestyle{fancy}%
	\fancyhead[L]{\nouppercase{\leftmark}}%
	\fancyhead[R]{\thepage}%
	\fancyfoot{}%
}
\DeclareOption{nofancy}{\renewcommand{\XnukFancy}{}}
\DeclareOption{logo}{%
	\renewcommand{\XnukTitle}[1]{\title{%
		\includegraphics[width=0.25\textwidth]{common-assets/logo.eps}%
		\\\vspace{1cm}%
		#1%
	}}%
}
\ProcessOptions*

\LoadClass[titlepage]{article}

% Banned packages:
% - Using `svg` package is weird: it has problems of resolving relative paths.
%   Just don't use it. Convert SVG to EPS by hand instead:
%     $ inkscape filename.svg --export-filename=newfilename.eps
%
% - Using `listings` on embedding code can show unsatisfied result
%   if the code contains CJK characters.
%   Previous good setting was:
%     \lstset{%
%       basicstyle=\ttfamily\small, tabsize=4, columns=fullflexible,
%       xleftmargin=1cm, xrightmargin=1cm
%     }

\RequirePackage[a4paper, scale=0.75]{geometry}
\RequirePackage{
	amsmath, amssymb, amsfonts,
	cancel, % \cancel{..} -> \ , \bcancel{..} -> / , \xcancel{..} -> X
	parskip, subfig, titlesec, fancyhdr,
	graphicx, tikz,
	pgffor, ifthen,
	underscore, datetime, kotex
}
\RequirePackage[export]{adjustbox}
\RequirePackage[section]{placeins}

% 딱히 outputdir을 외부에서 불러오는 좋은 방법을 찾지 못함
\RequirePackage[outputdir=.cache]{minted}

\IfPackageLoadedTF{fancyhdr}{
	\XnukFancy
}{}

\IfPackageLoadedTF{tikz}{
	\usetikzlibrary{positioning, arrows.meta, shapes.multipart}
}{}

\IfPackageLoadedTF{fontspec}{ % kotex가 포함하고 있음
	\setmonofont{Inconsolata}[AutoFakeSlant]
	\setmonohangulfont{Noto Sans Mono CJK KR}[AutoFakeSlant]
}{}

\IfPackageLoadedTF{minted}{
	\setminted{%
		autogobble, fontsize=\small, python3=true, tabsize=4, samepage,
		xleftmargin=1cm, xrightmargin=1cm
	}
}{}

\IfPackageLoadedTF{datetime}{
	\newdateformat{koreandate}{%
		{\THEYEAR}년 \twodigit{\THEMONTH}월 \twodigit{\THEDAY}일%
	}%
	\date{\koreandate\today}
}{}

\newcommand{\titl}[2]{\XnukTitle{#1}\author{#2}\maketitle}
\newcommand{\sectionbreak}{\clearpage}
\renewcommand{\figurename}{그림}

\newcommand{\rarr}{\rightarrow}
\newcommand{\Rarr}{\Rightarrow}
\newcommand{\LRarr}{\Leftrightarrow}

\newcommand{\dx}[0]{\mathrm{d}x}
\newcommand{\dy}[0]{\mathrm{d}y}
\newcommand{\deriv}[2]{\frac{\mathrm{d}#2}{\mathrm{d}#1}}
\newcommand{\pderiv}[2]{\frac{\partial#2}{\partial#1}}
\newcommand{\Lap}[1]{\mathcal{L}\left\{#1\right\}}
