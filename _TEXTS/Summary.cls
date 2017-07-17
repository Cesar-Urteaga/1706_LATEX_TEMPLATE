%-------------------------------------------------------------------------------
% Author      : Cesar R. Urteaga-Reyesvera
% Description : A personal class that I use to make my own summaries.
% Resource(s) : https://www.sharelatex.com/learn/Writing_your_own_class
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------- N.B.
% A class can be structured, grosso modo, by the following parts:
%   1. Identification
%   2. Preliminary declarations
%   3. Options
%   4. More declarations
%-------------------------------------------------------------------------------

%------------------------------------------------------------- 1. IDENTIFICATION
% Sets up the LATEX version in which the class will work.
\NeedsTeXFormat{LaTeX2e}
% Defines the name of the class, in this case "Summary", and establishes the
% release date (the format must be YYYY/MM/DD) with additional information.
\ProvidesClass{Summary}[2017/06/28 Personal summary class]

%-------------------------------------------------------------------------- N.B.
% So as to define a new command, you should use the "newcommand" instruction
% which has the following structure:
%   \newcommand{NewCommandName}[NumberParameters][DefaultValueForFirstParameter]
%              {DefinitionOfTheNewCommand}
% This command supports up to 9 parameters. If your command does not have any
% parameters, then you should not include NumberParameters and
% DefaultValueForFirstParameter (i.e., the parameters surrounded braces). The
% NewCommandName cannot contain any number.
% Example:
%   \newcommannd{exnc}[2][Chris]{Values are #1 and #2}
%   exnc{John}        returns "Values are Chris and John"
%   exnc[Louis]{John} returns "Values are Louis and John"
%-------------------------------------------------------------------------------

%--------------------------------------------------- 2. PRELIMINARY DECLARATIONS
% We call the parent class since we want to inherit the commands of this.
\LoadClass{article}

% Because we want to include commands from others packages we call them through
% packages.
\RequirePackage{color}
\RequirePackage{fancyhdr}
\RequirePackage{hyperref}
\RequirePackage{lastpage}
\RequirePackage{changepage}
\RequirePackage{graphicx}
\RequirePackage{enumitem}
%   This one allows you to use \sqbullet symbol.
\RequirePackage{mathabx}

% Definitions that we will use.
%   Color definitions, from darker to lighter (i.e., 01 is the faintest color).
%     Blue
\definecolor{Blue01}{RGB}{8,104,172}
%     Gray
\definecolor{Gray01}{RGB}{217,217,217}
\definecolor{Gray02}{RGB}{115,115,115}
\definecolor{Gray03}{RGB}{37,37,37}
% We include the new commands which will be available by the package.
%   HEADERS
%     Left
\def\LeftHeader{\empty}
\newcommand{\SetLeftHeader}[1]{\def\LeftHeader{#1}}
\newcommand{\ShowLeftHeader}{\LeftHeader}
%     Right
\def\RightHeader{\empty}
\newcommand{\SetRightHeader}[1]{\def\RightHeader{#1}}
\newcommand{\ShowRightHeader}{\RightHeader}
%   FOOTERS
%     Left
\def\LeftFooter{\empty}
\newcommand{\SetLeftFooter}[1]{\def\LeftFooter{#1}}
\newcommand{\ShowLeftFooter}{\LeftFooter}
%     Central
\def\CentralFooter{\empty}
\newcommand{\SetCentralFooter}[1]{\def\CentralFooter{#1}}
\newcommand{\ShowCentralFooter}{\CentralFooter}

%-------------------------------------------------------------------------- N.B.
% The \DeclareOption*{} command manages the options that are not explicitly
% defined by executing the given code when an unknown paramenter is passed.
% On one hand, the \PassOptionsToClass{}{} passes the option in the first
% pair of braces to the class given in the second braces.
% On the other hand, the command \ProcessOptions\relax must be included at the
% end of the options block in order to execute the code for each typed option.
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------- 3. OPTIONS
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%---------------------------------------------------------- 4. MORE DECLARATIONS
% This avoid the lines surrounding the links.
\hypersetup{pdfborder={0 0 0}}
% We remove the hyphenation between words.
\hyphenpenalty=1000000

% We reset the margins in order to change them later.
\textheight 0in \textwidth 0in
\oddsidemargin -1in \evensidemargin -1in
\topmargin -1in
\headheight 0in \headsep 0in
\footskip 0in

% The \changetext command has the following specification:
% \changetext  {⟨text height⟩}       {⟨text width⟩}
%              {⟨even-side margin⟩}  {⟨odd-side margin⟩}
%              {⟨column sep.⟩}       {⟨topmargin⟩}
%              {⟨headheight⟩}        {⟨headsep⟩}
%              {⟨footskip⟩}
\changepage{21.82cm}{16.59cm}{2.5cm}{2.5cm}{}{0.6cm}{1.5cm}{1cm}{1cm}

% Sets up the size of the font.
\renewcommand{\normalsize}{\fontsize{9}{10}\selectfont}

% Establishes the depth to which sections are numbered; therefore, if we
% want that none section will be numbered, we must use 0.
\setcounter{secnumdepth}{3}

% We define the headers and footers of the document.
\pagestyle{fancy}
%   Please refer to the page 10 of the fancyhdr documentation:
%     http://tug.ctan.org/macros/latex/contrib/fancyhdr/fancyhdr.pdf
\renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}
%   HEADERS
%     Left
\ifx\LeftHeader\empty
  \lhead{}
\else
  \lhead{\color{Gray02}{\ShowLeftHeader}}
\fi
%     Right
\ifx\RightHeader\empty
  \rhead{}
\else
  \rhead{\color{Gray02}{\ShowRightHeader}}
\fi
%     Lines
\renewcommand{\headrulewidth}{1pt}
\renewcommand{\headrule}{{\color{Gray01}
\hrule width\headwidth height\headrulewidth \vskip-\headrulewidth}}
%   FOOTERS
%     Left
\ifx\LeftFooter\empty
  \lfoot{}
\else
  \lfoot{\color{Gray02}{\small \ShowLeftFooter}}
\fi
%     Central
\ifx\CentralFooter\empty
  \cfoot{}
\else
  \cfoot{\color{Blue01}%
        {\href{mailto:\ShowCentralFooter}{\small \ShowCentralFooter}}}
\fi
\rfoot{{\small \color{Gray02}{\thepage\ of \pageref{LastPage}}}}
%     Lines
\renewcommand{\footrulewidth}{1pt}
\renewcommand{\footrule}{{\color{Gray01}
\hrule width\headwidth height\footrulewidth\vskip\footruleskip}}

% Sets up the symbol used in lists through the \itemize command.
%   We define a new environment to list items.
\renewcommand\labelitemi{$\sqbullet$}
%     Unordered list.
\newenvironment{ul}{\vspace*{-0.20cm}\begin{itemize}\itemsep-0.10cm}{%
\vspace*{-0.25cm}\end{itemize}}
%     Ordered numeric list.
\newenvironment{onl}{\begin{enumerate}[topsep=0.14cm,itemsep=-0.10cm,leftmargin=1cm,label=\arabic*.-]}{%
\hspace*{0.20cm}\end{enumerate}}
%     Ordered letter list.
\newenvironment{oll}{\begin{enumerate}[topsep=0.14cm,itemsep=-0.10cm,leftmargin=1cm,label=\alph*)]}{%
\hspace*{0.20cm}\end{enumerate}}
%     Ordered roman list.
\newenvironment{orl}{\begin{enumerate}[topsep=0.14cm,itemsep=-0.10cm,leftmargin=1cm,label=\roman*.]}{%
\hspace*{0.20cm}\end{enumerate}}

% Create a new command to embed images.
\newcommand{\img}[2][1]{\includegraphics[scale=#1]{#2}}
