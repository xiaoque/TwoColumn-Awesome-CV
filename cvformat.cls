%%
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

\usepackage[normalem]{ulem} % for underline

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
% Set the FontAwesome font to be up-to-date.

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

% Use to draw horizontal line with specific thickness

\def\vhrulefill#1#2{%
  \leavevmode
  \vskip -5mm 
  \hbox to \textwidth{\hss \textcolor{#1}{\rule{\textwidth}{#2}}\hss}%
  \vskip -1mm 
}

% horizontal line for side column
\def\vhrulesidefill#1#2{%
  \leavevmode
  \vskip -8mm 
  \hbox to \textwidth{
    \hspace{0.3cm} % Adjust the left margin here (10mm is just an example)
    \hss \textcolor{#1}{\rule{\textwidth - 0.3cm}{#2}} \hss
  }%
  \vskip -1mm 
}

\setlist[itemize,1]{label=-, nosep, leftmargin=1em,topsep=2pt, partopsep=0pt,itemsep=2pt, parsep=0pt}

% custom href with a underline
\newcommand{\ulink}[2]{%
  \href{#1}{\textcolor{graytext}{\uline{#2}}}%
}


% adjust icon size
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
            \vspace{5mm} 
            \hspace{5mm} 
            \raggedright
             #2

            \hspace{5mm}
        \end{minipage} 
        \\
    
    \end{tabularx}    
}



%----------------------------------------------------------------------------------------
%	 SECTION HEADER DEFINITIONS
%----------------------------------------------------------------------------------------

\newcommand{\mainsection}[1]{
    \vspace*{3ex}
    \sectionstyle{#1}
    \par%
    \vspace*{-1.5ex}
    {\color{sectionline}\hrulefill}
    \par
    \vspace*{0.7ex}
}

\newcommand{\profilesection}[1]{
    \vspace*{2ex}
    \hspace{10pt}\sectionstyle{#1}
    \par%
    \vspace*{-2ex}
    \hspace{10pt}{\color{sectionline}\hrulefill}
}

% header for main section
\newcommand{\cvsection}[1]{%
  \par\addvspace{1ex}
  \mainsection{#1}
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
% Define a header for CV
\newcommand{\nameposition}{
    \setlength\tabcolsep{0pt}
    \begin{tabular*}{\textwidth - 0.3cm}{L{0.3cm}L{\textwidth - 0.8cm}}
    & \headernamestyle{\@name} \\[5mm]
    & \headerpositionstyle{\@position}\\
    \end{tabular*}
    \par\addvspace{1em}    
}

\newcommand{\makeinfoprofile}{
    \profilesection{Personal Info}
    \makeinfoList    
}

\newcommand{\makeinfoprofilefr}{
    \profilesection{Contact}
    \makeinfoList    
}

\newcommand{\makeinfoList}{
    \setlength\tabcolsep{0pt}
    \par\addvspace{1em}
    \begin{tabular*}{\textwidth - 0.3cm}{L{0.5cm}L{0.7cm}L{\textwidth - 1.5cm}}
        & {\color{awesome}\fixicon{\faPhone}} & \@mobile \\[2pt]
        & {\color{awesome}\fixicon{\faMapMarker}} &  \@location \\[2pt]
        & {\color{awesome}{\faEnvelope}} & \href{mailto:\@email}{\@email} \\[2pt]
        & {\color{awesome}\fixicon{\faLinkedinSquare}} &  
                    \href{https://www.linkedin.com/in/\@linkedin}{\@linkedin} \\
        & {\color{awesome}\fixicon{\faGithubSquare}} &  
            \href{https://github.com/\@github}{\@github} \\
    \end{tabular*}
    \par\addvspace{1em}    
}



\setlength{\tabcolsep}{0pt}


%----------------------------------------------------------------------------------------
%	 SECTIONS IN CV
%----------------------------------------------------------------------------------------
\newcommand{\aboutme}[1]{
    %\profilesection{About me}
    \par\addvspace{3em}
    \begin{justify}
        {#1}
    \end{justify}
}


% Define a CV experience entry
% Usage:
% \experience
%   {<Position>}         % #1: Job Position (e.g., "Software Engineer")
%   {<Title>}            % #2: Title or Company Name (e.g., "Vintra")
%   {<Location>}         % #3: Location (e.g., "Barcelona")
%   {<Date>}             % #4: Date range (e.g., "2017–Now")
%   {<Project>}          % #5: Project name or summary line (e.g., "Real-time Video Analysis System")
%   {<Description Items>} % #6: Description list as \item elements (e.g., \item Did X \item Built Y)
%   {<Tech Stack>}       % #7: Technologies used (e.g., "Python, Docker, Kubernetes")

\newcommand{\experience}[7]{%
    \vspace{1mm}
    \setlength\tabcolsep{0pt}
    \begin{tabular*}{\textwidth - 0.1cm}{L{\textwidth - 5.1cm} R{5cm}}
        {\largetitlestyle{#2 - } \titlestyle{#1}}   
        & {\graydatestyle{#3 · #4}} \\
    \end{tabular*}
    \vspace{1mm}
    \italictextstyle{#5}
    \begin{justify}
    {#6}
    \end{justify}
    \vspace{1mm}
    \boldtextstyle{Tech Stack:} {#7}
}

% \education
% #1 = Date
% #2 = School Abbr
% #3 = School Full
% #4 = [Optional description]
% #5 = Degree
% #6 = Major

\NewDocumentCommand{\education}{m m m o m m}{%
    \vspace{1mm}
    \setlength\tabcolsep{0pt}
    % Row 1: Degree - Major
    \begin{tabular*}{\textwidth - 0.1cm}{L{0.4cm}L{\textwidth - 0.5cm}}
        & \boldtextstyle{#5 - #6} \\
    \end{tabular*}
    % Row 2: Right-aligned Date
    \begin{tabular*}{\textwidth - 0.1cm}{L{0.4cm}R{\textwidth - 0.5cm}}
        &  \graydatestyle{#1}\\
    \end{tabular*}
    % Row 3: Optional Description + School
    \begin{tabular*}{\textwidth - 0.1cm}{L{0.4cm}L{\textwidth - 0.5cm}}
        \IfValueT{#4}{ &\descriptionstyle{#4} \\}
        & \boldtextstyle{#2}, \textit{#3} \\
    \end{tabular*}
    \vspace{1mm}
}


\newenvironment{skills}{%
    \noindent
  \begin{flushleft}
    \vspace{1mm}
    \setlength\tabcolsep{0pt}
    \begin{tabular*}{\textwidth - 0.1cm}{L{0.4cm}L{\textwidth - 0.5cm}}
}{%
    \end{tabular*}
  \end{flushleft}
}


% \skill
% #1 = Caption
% #2 = Details
\newcommand*{\skill}[2]{%
  & \boldtextstyle{#1 :} \\[0.3ex]
  & \begin{minipage}[t]{\textwidth - 0.8cm}
        {#2}
    \end{minipage} \\
  \vspace{2mm}
}



\newenvironment{languages}{%
    \noindent
  \begin{flushleft}
    \vspace{2mm}
    \setlength\tabcolsep{0pt}
    \begin{tabular*}{\textwidth - 0.1cm}{L{0.5cm} L{2cm} L{\textwidth - 2cm}}
}{%
    \end{tabular*}
  \end{flushleft}
}
% \laguange
% #1 = Lang
% #2 = Fluent / Native ...
\newcommand*{\cvlanguage}[2]{%
  & \boldtextstyle{#1}  & : {#2} \\[0.3ex]
}

