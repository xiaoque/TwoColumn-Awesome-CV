%%
%% Copyright (c) 2018-2025 xiaoque
%% https://github.com/xiaoque/TwoColumnResume-latex
%%
%% Resume LaTeX template.
%% Based on
%%     Awesome CV https://github.com/posquit0/Awesome-CV

%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------
\ProvidesClass{cvformat}[Curriculum Vitae Class]
\NeedsTeXFormat{LaTeX2e}

%-------------------------------------------------------------------------------
%                Class options
%
% (need to be done before the external package loading, for example because
% we need \paperwidth, \paperheight and \@ptsize to be defined before loading
% geometry and fancyhdr)
%-------------------------------------------------------------------------------
% Inherit options of article
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

%-------------------------------------------------------------------------------
%                3rd party packages
%-------------------------------------------------------------------------------
% Needed to make fixed length table
\RequirePackage{array}
% Needed to handle list environment
\RequirePackage{enumitem}
% Needed to handle text alignment
\RequirePackage{ragged2e}
% Needed to configure page layout
\RequirePackage[
    a4paper,
    left=0.8cm,
    top=1.5cm,
    right=0.5cm,
    bottom=1cm,
    twocolumn,
    columnsep=1cm
]{geometry}
% Needed to make header & footer effeciently
\RequirePackage{fancyhdr}
% Needed to manage colors
\usepackage[table]{xcolor}
% Needed to use a toolbox of programming tools
\RequirePackage{etoolbox}
% Needed to change line spacing in specific environment
\RequirePackage{setspace}
% Multirow in tables
\RequirePackage{multirow}
% Needed to manage fonts
\RequirePackage[quiet]{fontspec}
\RequirePackage{fontawesome}
\RequirePackage[default,opentype]{sourcesanspro}
% Needed to deal a paragraphs
\RequirePackage{parskip}
% Provides icons for the contact details
\RequirePackage{marvosym}
% Needed for dynamic width table
\RequirePackage{tabularx}
\usepackage{titlesec}
\usepackage{calc}
% Needed for adjust icon
\usepackage{graphicx}  
% Needed for optional input
\usepackage{xparse}
% Needed for customize underline
\usepackage[normalem]{ulem}

\AtBeginDocument{%
  \hypersetup{%
    pdfauthor={\@name},%
    pdftitle={\@pdftitle},%
    pdfkeywords={},%
    colorlinks=true,linkcolor=darkblue,urlcolor=darkblue
  }%
}
\RequirePackage[hidelinks,unicode]{hyperref}


\pagestyle{empty}

%-------------------------------------------------------------------------------
%                Configuration for directory locations
%-------------------------------------------------------------------------------
% Configure a directory location for fonts(default: 'fonts/')
\newcommand*{\fontdir}[1][font/]{\def\@fontdir{#1}}
\fontdir

%-------------------------------------------------------------------------------
%                Configuration for layout
%-------------------------------------------------------------------------------
%% Page Layout

%% Header & Footer
% Set offset to each header and footer
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer fields
\fancyhf{}
% Enable if you want to make header or footer using fancyhdr
\pagestyle{fancy}


%-------------------------------------------------------------------------------
%                Configuration for colors
%-------------------------------------------------------------------------------

\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{bggray}{HTML}{f2f2f2}
\definecolor{darkblue}{HTML}{2862A6}
\definecolor{darktext}{HTML}{414141}
\definecolor{awesome-nephritis}{HTML}{27AE60}
\definecolor{awesome-concrete}{HTML}{95A5A6}

\colorlet{awesome}{darkblue}
\colorlet{text}{black}
\colorlet{graytext}{darkgray}
\colorlet{boldtext}{darkblue}
\colorlet{sectionline}{darkblue}

\newcommand{\graytext}[1]{\textcolor{gray}{#1}}
%-------------------------------------------------------------------------------
%                Configuration for fonts
%-------------------------------------------------------------------------------

% Set font for header (default is Roboto)
\newfontfamily\headerfont[
  Path=\@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic,
]{Roboto}

\newfontfamily\headerfontlight[
  Path=\@fontdir,
  UprightFont=*-Thin,
  ItalicFont=*-ThinItalic,
  BoldFont=*-Medium,
  BoldItalicFont=*-MediumItalic,
]{Roboto}

\newcommand*{\footerfont}{\sourcesanspro}
\newcommand*{\bodyfont}{\sourcesanspro}
\newcommand*{\bodyfontlight}{\sourcesansprolight}

%-------------------------------------------------------------------------------
%                Configuration for styles
%-------------------------------------------------------------------------------
% Configure styles for each CV elements

% Font for header element
\newcommand*{\headernamestyle}[1]{{\fontsize{18pt}{1em}\headerfont\bfseries\color{awesome} #1}}
\newcommand*{\headerpositionstyle}[1]{{\fontsize{16pt}{1em}\headerfont\scshape\color{graytext} #1}}

% Font for section header
\newcommand*{\sectionstyle}[1]{{\fontsize{15pt}{1em}\bodyfontlight\bfseries\scshape\color{awesome} #1}}

% Font for expericence section
\newcommand*{\largetitlestyle}[1]{{\fontsize{13pt}{1em}\headerfont\scshape\color{awesome} #1}}
\newcommand*{\titlestyle}[1]{{\fontsize{11pt}{1em}\headerfont\color{awesome} #1}}
\newcommand*{\graydatestyle}[1]{{\fontsize{11pt}{1em}\bodyfontlight\slshape\color{graytext} #1}}

% Font for global text
%\newcommand*{\normaltextstyle}[1]{{\fontsize{11pt}{1em}\bodyfont\color{darktext} #1}}
\newcommand*{\boldtextstyle}[1]{{\fontsize{11pt}{1em}\bodyfontlight\bfseries #1}}
\newcommand*{\descriptionstyle}[1]{{\fontsize{10pt}{1em}\bodyfontlight\slshape #1}}
\newcommand*{\italictextstyle}[1]{{\fontsize{11pt}{1em}\slshape #1}}


%-------------------------------------------------------------------------------
%                Commands for utilities
%-------------------------------------------------------------------------------
% Use to align an element of tabular table
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% Use to draw horizontal line with specific thickness and color
% Usage \vhrulefill{<color>}{<e.g, 0.4pt>}
\def\vhrulefill#1#2{%
  \leavevmode
  \vskip -5mm 
  \hbox to \textwidth{\hss \textcolor{#1}{\rule{\textwidth}{#2}}\hss}%
  \vskip -1mm 
}

% Horizontal line for side column with specific thickness and color
% Usage \vhrulesidefill{<color>}{<e.g, 0.4pt>}
\def\vhrulesidefill#1#2{%
  \leavevmode
  \vskip -8mm 
  \hbox to \textwidth{
    \hspace{0.3cm} % Adjust the left margin here
    \hss \textcolor{#1}{\rule{\textwidth - 0.3cm}{#2}} \hss
  }%
  \vskip -1mm 
}

% Define style for itemize
\setlist[itemize,1]{label=-, nosep, leftmargin=1em,topsep=2pt, partopsep=0pt,itemsep=2pt, parsep=0pt}

% Custom href with a underline
% Usage \ulink{<link>}{<text>}
\newcommand{\ulink}[2]{%
  \href{#1}{\textcolor{graytext}{\uline{#2}}}%
}

% Width of the left margin for side column
\newlength{\leftmarginwidth}
\setlength{\leftmarginwidth}{5mm}

% Width of the left column for experience
\newlength{\leftcolumnwidthexperience}
\setlength{\leftcolumnwidthexperience}{12em}
% Width of the left column for language
\newlength{\leftcolumnwidthlanguage}
\setlength{\leftcolumnwidthlanguage}{5em}

% Adjust icon size
% Usage \fixicon{<iconname>}
\newcommand{\fixicon}[1]{\resizebox{1em}{1em}{#1}}


%-------------------------------------------------------------------------------
%                Commands for personal information
%-------------------------------------------------------------------------------
\newcommand*{\pdftitle}[1]{\def\@pdftitle{#1}}

% Define custom commands for CV info
\newcommand*{\name}[1]{\def\@name{#1}}

% Define writer's address
% Usage: \location{<location>}
\newcommand*{\location}[1]{\def\@location{#1}}

% Define writer's position
% Usage: \name{<position>}
\newcommand*{\position}[1]{\def\@position{#1}}

% Defines writer's mobile (optional)
% Usage: \mobile{<mobile number>}
\newcommand*{\mobile}[1]{\def\@mobile{#1}}

% Defines writer's email (optional)
% Usage: \email{<email adress>}
\newcommand*{\email}[1]{\def\@email{#1}}

% Defines writer's linked-in (optional)
% Usage: \linkedin{<linked-in-nick>}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}

% Defines writer's github (optional)
% Usage: \github{<github-nick>}
\newcommand*{\github}[1]{\def\@github{#1}}



%----------------------------------------------------------------------------------------
%	 2-COLUMNS DEFINITIONS
%----------------------------------------------------------------------------------------

\newcommand{\twocolumncv}[2]{%
    \noindent
    \begin{tabularx}{\textwidth}{L{0.65\textwidth}@{\hspace{4mm}} >{\raggedright\arraybackslash\columncolor{bggray}}L{0.32\textwidth}@{}}
        \begin{minipage}[t]{\linewidth}#1\end{minipage} 
        &
        \begin{minipage}[t]{0.95\linewidth}
            \vspace{\leftmarginwidth} 
            \hspace{\leftmarginwidth} 
            \raggedright
             #2

            \hspace{\leftmarginwidth}
        \end{minipage} 
        \\
    
    \end{tabularx}    
}



%----------------------------------------------------------------------------------------
%	 SECTION HEADER DEFINITIONS
%----------------------------------------------------------------------------------------
% Define title for sections
\newcommand{\sectiontitle}[2]{
    \vspace*{2.5ex}
    \hspace{#1}
    \sectionstyle{#2}
    \par%
    \vspace*{-1.5ex}
    \hspace{#1}
    {\color{sectionline}\hrulefill}
}

% Define title for left column
\newcommand{\mainsectiontitle}[1]{
    \sectiontitle{0pt}{#1}
    \par
    \vspace*{0.5ex}
}
% Define title for side column
% Usage \sidesectiontitle{<section name>}
\newcommand{\sidesectiontitle}[1]{
    \sectiontitle{10pt}{#1}
}

% Define header for main section
% Usage \cvsection{<section name>}
\newcommand{\mainsection}[1]{%
  \par\addvspace{1ex}
  \mainsectiontitle{#1}
  \par\nobreak\addvspace{0.8ex}
}



% Unified section for side column
\newenvironment{sidesection}{
    \begin{flushleft}
    }{%
    \end{flushleft}
}

%-------------------------------------------------------------------------------
%                Commands for header (personal info)
%-------------------------------------------------------------------------------
% Define a header (name and position on side column) for CV
% Usage \nameposition
\newcommand{\nameposition}{
    \setlength\tabcolsep{0pt}
    \begin{tabular*}{\textwidth}{L{\leftmarginwidth}L{\textwidth - \leftmarginwidth}}
    & \headernamestyle{\@name} \\[\leftmarginwidth]
    & \headerpositionstyle{\@position}\\
    \end{tabular*}
    \par\addvspace{1em}    
}

% Define the section for contact info
% Usage \makeinfoprofile{<section title>}
\newcommand{\makeinfoprofile}[1]{
    \sidesectiontitle{#1}
    \makeinfoList    
}

% Define contents for contact info
\newcommand{\makeinfoList}{
    \setlength\tabcolsep{0pt}
    \par\addvspace{1em}
    \begin{tabular*}{\textwidth}{L{\leftmarginwidth} L{0.7cm} L{\textwidth - 1.5cm}}
        & {\color{awesome}\fixicon{\faPhone}} & \@mobile \\[2pt]
        & {\color{awesome}\fixicon{\faMapMarker}} &  \@location \\[2pt]
        & {\color{awesome}{\faEnvelope}} & \href{mailto:\@email}{\@email} \\[2pt]
        & {\color{awesome}\fixicon{\faLinkedinSquare}} &  
                    \href{https://www.linkedin.com/in/\@linkedin}{\@linkedin} \\[2pt]
        & {\color{awesome}\fixicon{\faGithubSquare}} &  
            \href{https://github.com/\@github}{\@github} \\
    \end{tabular*}
    \par\addvspace{1em}    
}



\setlength{\tabcolsep}{0pt}


%----------------------------------------------------------------------------------------
%	 SECTIONS IN CV
%----------------------------------------------------------------------------------------
% Define section for about me
% Usage \aboutme{<short presentation>}
\newcommand{\aboutme}[1]{
    \mainsectiontitle{About me}
    \begin{justify}
        {#1}
    \end{justify}
}


% Define an experience entry
% Usage:
% \experience
%   {<Position>}         % #1: Job Position (e.g., "Software Engineer")
%   {<Title>}            % #2: Title or Company Name (e.g., "Vintra")
%   {<Location>}         % #3: Location (e.g., "Barcelona")
%   {<Date>}             % #4: Date range (e.g., "2017–Now")
%   {<Project>}          % #5: Project name or summary line (e.g., "Real-time Video Analysis System")
%   {<Description Items>} % #6: Description list in itemize (e.g., \begin{itemize} \item{<task 1>} \end{itemize} )
%   {<Tech Stack>}       % #7: Technologies used (e.g., "Python, Docker, Kubernetes")
\newcommand{\experience}[7]{%
    \vspace{1mm}
    \setlength\tabcolsep{0pt}
    \begin{tabular*}{\textwidth}{L{\textwidth - \leftcolumnwidthexperience} R{\leftcolumnwidthexperience}}
        {\largetitlestyle{#2 - } \titlestyle{#1}}   
        & {\graydatestyle{#3 · #4}} \\
    \end{tabular*}
    \vspace{1mm}
    \italictextstyle{#5}
    % Description should add itemize enviroment
    % Usage \begin{itemize} \item{<task 1>} \end{itemize}
    \begin{justify}
    {#6}
    \end{justify}
    \vspace{1mm}
    \boldtextstyle{Tech Stack:} {#7}
}

% Define an education entry for the CV
% Usage:
% \education
%   {<Date>}            % #1: Date or time period (e.g., "2015–2019")
%   {<School Abbr>}     % #2: Abbreviated school name (e.g., "MIT")
%   {<School Full>}     % #3: Full school name (e.g., "Massachusetts Institute of Technology")
%   [<Description>]     % #4: Optional description or honors (e.g., "Graduated with Honors")
%   {<Degree>}          % #5: Degree earned (e.g., "B.Sc.")
%   {<Major>}           % #6: Major or field of study (e.g., "Computer Science")
\NewDocumentCommand{\education}{m m m o m m}{%
    \vspace{1mm}
    \setlength\tabcolsep{0pt}
    % Row 1: Degree - Major
    \begin{tabular*}{\textwidth}{L{\leftmarginwidth}L{\textwidth - \leftmarginwidth}}
        & \boldtextstyle{#5 - #6} \\
    \end{tabular*}
    % Row 2: Right-aligned Date
    \begin{tabular*}{\textwidth}{L{\leftmarginwidth}R{\textwidth - \leftmarginwidth}}
        &  \graydatestyle{#1}\\
    \end{tabular*}
    % Row 3: Optional Description + School
    \begin{tabular*}{\textwidth}{L{\leftmarginwidth}L{\textwidth - \leftmarginwidth}}
        \IfValueT{#4}{ &\descriptionstyle{#4} \\}
        & \boldtextstyle{#2}, \textit{#3} \\
    \end{tabular*}
    \vspace{1mm}
}

% Define an enviroment for skills
% Usage \begin{skills} \end{skills}
\newenvironment{skills}{%
    \noindent
  \begin{flushleft}
    \vspace{1mm}
    \setlength\tabcolsep{0pt}
    \begin{tabular*}{\textwidth}{L{\leftmarginwidth}L{\textwidth - \leftmarginwidth}}
}{%
    \end{tabular*}
  \end{flushleft}
}


% Define a skill entry for the CV
% Usage:
% \skill
%   {<Caption>}       % #1: Skill category or caption (e.g., "Programming Languages")
%   {<Details>}       % #2: Specific skills or tools
%                     % (e.g., \begin{itemize} \item{<skill 1>} \end{itemize} )
\newcommand*{\skill}[2]{%
  & \boldtextstyle{#1 :} \\[0.3ex]
  & \begin{minipage}[t]{\textwidth - 2em}
        {#2}
    \end{minipage} \\
  \vspace{2mm}
}


% Define an enviroment for languages
% Usage \begin{languages} \end{languages}
\newenvironment{languages}{%
    \noindent
  \begin{flushleft}
    \vspace{2mm}
    \setlength\tabcolsep{0pt}
    \begin{tabular*}{\textwidth}{L{\leftmarginwidth} L{\leftcolumnwidthlanguage} L{\textwidth - \leftcolumnwidthlanguage - \leftmarginwidth}}
}{%
    \end{tabular*}
  \end{flushleft}
}

% Define a language proficiency entry for the CV
% Usage:
% \cvlanguage
%   {<Language>}         % #1: Language name (e.g., "English")
%   {<Proficiency>}      % #2: Proficiency level (e.g., "Native", "Fluent", "Intermediate")
\newcommand*{\cvlanguage}[2]{%
  & \boldtextstyle{#1}  & : {#2} \\[0.3ex]
}