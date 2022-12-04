% Standard preamble for homework and tests
% Written by Allyson Robert

% Declares itself
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uhreport}[2022/12/04 A class to write stylised student reports at Hasselt University, including a coloured header.]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Class definitions     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Needed for option behavior
\RequirePackage[dvipsnames]{xcolor}

% Options handling defaults for the different schools and faculties
\DeclareOption{ses}{\definecolor{accent}{HTML}{E6007E}}
\DeclareOption{ssw}{\definecolor{accent}{HTML}{00A13A}}
\DeclareOption{mob}{\definecolor{accent}{RGB}{196, 214, 0}}

\DeclareOption{wet}{\definecolor{accent}{RGB}{0, 110, 184}}
\DeclareOption{bew}{\definecolor{accent}{RGB}{0, 159, 233}}
\DeclareOption{ark}{\definecolor{accent}{RGB}{232, 119, 34}}
\DeclareOption{glw}{\definecolor{accent}{RGB}{171, 33, 131}}
\DeclareOption{reval}{\definecolor{accent}{RGB}{0, 155, 119}}
\DeclareOption{iiw}{\definecolor{accent}{RGB}{103, 193, 185}}
\DeclareOption{rec}{\definecolor{accent}{RGB}{228, 0, 42}}

% Disable twocolumn
\DeclareOption{twocolumn}{\OptionNotUsed}

% Set defaults
\ExecuteOptions{wet}

% Pass remaining options to the article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% The custom class builds on the article class
\LoadClass[11pt, a4paper]{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         Packages         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Language package
\RequirePackage[dutch]{babel}

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

% Bibliography apa style
\RequirePackage{apacite}

% References and links
\RequirePackage[colorlinks=true, linktoc=all]{hyperref}
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
            % \includegraphics[width=6cm]{UHasselt_FAC_Logo}
            \includegraphics[width=6cm]{Logo/UHasselt_Logo_Tall.png}
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
        %     \includegraphics[width = 3.5cm]{Logo/UHasselt_Logo_Tall.png}
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
    \fancyfoot[L]{\includegraphics[width = 3.5cm]{Logo/UHasselt_Logo_Flat.jpg}}
    \fancyfoot[R]{\thepage~/~\pageref{LastPage}}
    
    % Resize header\footer rule widths
    \renewcommand{\headrulewidth}{0pt}

}
    
\pagestyle{body}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Defined Environments   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%


