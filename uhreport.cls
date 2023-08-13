% Standard preamble for homework and tests
% Written by Allyson Robert

% Declares itself
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uhreport}[2022/12/04 A class to write stylised student reports at Hasselt University, including a coloured header.]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Class definitions     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Package needed for colour option behaviour
\RequirePackage[dvipsnames]{xcolor}

% Path to default language for the logo
\newcommand{\logolanguage}{NL}
% Change language directory bases on selected option
\DeclareOption{nl}{
    \renewcommand{\logolanguage}{NL}
    \PassOptionsToPackage{main=dutch}{babel}
    \PassOptionsToPackage{dutch}{cleveref}
    
}
\DeclareOption{en}{
    \renewcommand{\logolanguage}{EN}
    \PassOptionsToPackage{main=british}{babel}
    \PassOptionsToPackage{british}{cleveref}
}

% Path to default title logo
\newcommand{\logofaculty}{WET}
\newcommand{\titlelogo}{Logo/Faculty/\logolanguage/\logofaculty-blok.eps}
% Options handling defaults for the different schools
\DeclareOption{ses}{
    \definecolor{accent}{HTML}{E6007E}
    \renewcommand{\logofaculty}{SES}
}
\DeclareOption{sw}{
    \definecolor{accent}{HTML}{00A13A}
    \renewcommand{\logofaculty}{SW}
}
\DeclareOption{mob}{
    \definecolor{accent}{RGB}{196, 214, 0}
    \renewcommand{\logofaculty}{MOB}
}
% Options handling defaults for the different faculties
\DeclareOption{wet}{
    \definecolor{accent}{RGB}{0, 110, 184}
    \renewcommand{\logofaculty}{WET}
}
\DeclareOption{bew}{
    \definecolor{accent}{RGB}{0, 159, 233}
    \renewcommand{\logofaculty}{BEW}
}
\DeclareOption{ark}{
    \definecolor{accent}{RGB}{232, 119, 34}
    \renewcommand{\logofaculty}{ARK}
}
\DeclareOption{glw}{
    \definecolor{accent}{RGB}{171, 33, 131}
    \renewcommand{\logofaculty}{GLW}
}
\DeclareOption{reval}{
    \definecolor{accent}{RGB}{0, 155, 119}
    \renewcommand{\logofaculty}{GLW}
}
\DeclareOption{iiw}{
    \definecolor{accent}{RGB}{103, 193, 185}
    \renewcommand{\logofaculty}{IIW}
}
\DeclareOption{rec}{
    \definecolor{accent}{RGB}{228, 0, 42}
    \renewcommand{\logofaculty}{REC}
}

% Disable twocolumn
\DeclareOption{twocolumn}{\OptionNotUsed}

% Set defaults
% \ExecuteOptions{wet, nl}

% Pass remaining options to the article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Package needed for language option behaviour
\RequirePackage{babel}

% The custom class builds on the article class
\LoadClass[11pt, a4paper]{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         Packages         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Language package

% Header
\RequirePackage{fancyhdr}
\RequirePackage{titling}
\RequirePackage{lastpage}
\RequirePackage{graphicx}

% Aesthetics, layout and font
\RequirePackage{multicol}
\RequirePackage{tocbibind}
\RequirePackage[explicit]{titlesec}
\RequirePackage[T1]{fontenc}
\RequirePackage{helvet}
\RequirePackage{chngcntr}
\RequirePackage[normalem]{ulem}

% Improvements
\RequirePackage{enumitem}
\RequirePackage{chngcntr}

% File management
\RequirePackage{import}

% Top red bar
\RequirePackage{tikz}

% Open Sans font is easier to read
\RequirePackage[default,oldstyle]{opensans}

% Layout
\RequirePackage[margin=1in]{geometry}
\RequirePackage{anyfontsize}

% References and links
\RequirePackage[colorlinks=true, linktoc=all]{hyperref}
\RequirePackage{apacite}
\RequirePackage[noabbrev]{cleveref}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Definition of things   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Shorthand for new paragraph
\newcommand{\npar}{\par\medskip} 

% No indentation
\setlength\parindent{0pt}

% Defince \mentor{} element
\newcommand*{\mentor}[1]{\gdef\thementor{#1}}
\newcommand*{\thementor}{Insert \textbackslash mentor\{\} below \textbackslash date\{\}}

% Defince \course{} element
\newcommand*{\course}[1]{\gdef\thecourse{#1}}
\newcommand*{\thecourse}{Insert \textbackslash course\{\} below \textbackslash date\{\}}

% Defince \course{} element
\newcommand*{\degree}[1]{\gdef\thedegree{#1}}
\newcommand*{\thedegree}{Insert \textbackslash degree\{\} below \textbackslash date\{\}}

% Defince \course{} element
\newcommand*{\acyear}[1]{\gdef\theacyear{#1}}
\newcommand*{\theacyear}{Insert \textbackslash acyear\{\} below \textbackslash date\{\}}
%%%%%%%%%%%%%%%%%%%%%
%     Titlepage     %
%%%%%%%%%%%%%%%%%%%%%
\renewcommand*{\maketitle}{%
    \newgeometry{top=7.75cm, bottom=10mm, left=1in, right=1in}
    \begin{titlepage}
        \thispagestyle{empty}
        \begin{tikzpicture}[remember picture,overlay]
            \node[yshift=-7cm] at (current page.north west)
              {\begin{tikzpicture}[remember picture, overlay]
                \fill[accent] (0,0) rectangle
                  (\paperwidth,7cm);
               \end{tikzpicture}
            };
        \end{tikzpicture}
        \begin{minipage}[b]{6cm}
            % Logo of the faculty in question
            % \includegraphics[width=6cm]{SES-blok.eps}
            \includegraphics[width=6cm]{\titlelogo}
        \end{minipage}
        
        \vfill
        \begin{minipage}{\textwidth}
                \flushright
                {\fontsize{35}{42}\selectfont\textbf{\textsf{\thecourse}}} \\
                \LARGE \textbf{\thedegree} \\
                {\color{accent}\textbf{\thetitle}} \\
        \end{minipage}
        
        \vfill
        \begin{minipage}{\textwidth}
                \flushright 
                \normalsize \textbf{Docent(en):} \\ \thementor  \\
        \end{minipage}
        
        \vfill
        \begin{minipage}{\textwidth}
                \flushright 
                \normalsize \textbf{Student(en):} \\ \theauthor 
        \end{minipage}
        
        \vfill
        \begin{minipage}{\textwidth}
                \flushright
                \normalsize \thedate \\
                \small Academiejaar \theacyear \\
                \noindent\rule{\textwidth}{0.4pt}
        \end{minipage}
        \vfill
        % \hfill
        % \begin{minipage}[t]{3.5cm}
        %     \includegraphics[width = 3.5cm]{Logo/standaard.eps}
        % \end{minipage}%
    \end{titlepage}
    \clearpage
    \restoregeometry
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definition of the footer %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Remove footer from titlepage

% Define the style of all pages
\pagestyle{fancy}
\fancypagestyle{body}{
    \fancyhf{}
    
    \setlength{\headheight}{14pt} 
    \setlength{\headsep}{0.5cm} 
    \setlength{\footskip}{15mm} 
    \setlength{\textheight}{24cm}
    
    \fancyhead[L]{
        \begin{tikzpicture}[remember picture,overlay]
            \node[yshift=-1cm] at (current page.north west)
              {\begin{tikzpicture}[remember picture, overlay]
                \fill[accent] (0,0) rectangle
                  (\paperwidth,1cm);
               \end{tikzpicture}
            };
        \end{tikzpicture}
    }
    
    % Footer definition
    \fancyfoot[L]{\includegraphics[width = 3.5cm]{Logo/liggend.eps}}
    \fancyfoot[R]{\thepage~/~\pageref{LastPage}}
    
    % Resize header\footer rule widths
    \renewcommand{\headrulewidth}{0pt}

}
    
\pagestyle{body}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Defined Environments   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%


