% This template is adapted from the <https://tex.stackexchange.com/questions/276410/how-to-match-width-of-tcolorbox-box-in-this-cornell-notes-template>.
% pass argument to class file
% https://tex.stackexchange.com/questions/250159/how-to-pass-title-or-other-parameter-to-class-file
% format date
% https://tex.stackexchange.com/questions/152392/date-format-yyyy-mm-dd
% fancyhdr
% https://tex.stackexchange.com/questions/434366/pass-title-and-author-to-fancyhdr-in-class-file

\ProvidesClass{note}
\LoadClass{article} 
\RequirePackage{tcolorbox}
\RequirePackage{parcolumns}
\RequirePackage{xparse}
\RequirePackage{tikz}
\RequirePackage{tikzpagenodes}
\RequirePackage{xkeyval}%
\RequirePackage[yyyymmdd]{datetime}
\renewcommand{\dateseparator}{--}
\tcbuselibrary{skins}
\RequirePackage{fancyhdr}

% --------------------- cornelltitle ---------------------------

\DeclareDocumentCommand\cornelltitle{ m }
{
    \vspace{-3em}
        \begin{tcolorbox}[colback=black!05,colframe=black!25, width=\textwidth,lowerbox=invisible]
                {\Large\texttt #1}
        \end{tcolorbox}
}

% --------------------- summary ---------------------------
\DeclareDocumentCommand\summary{ m m }
{
    \begin{tcolorbox}[colback=orange!10,colframe=orange!80, width=\textwidth]
        #1
    \tcblower 
        #2
    \end{tcolorbox}
}
% --------------------- note ---------------------------
\DeclareDocumentCommand\note{ o m }
{
    \begin{parcolumns}[colwidths={1=.3\textwidth},nofirstindent]{2}
        \colchunk{ 
            \IfNoValueF{#1} {
                \begin{tcolorbox}[colback=red!05,colframe=red!25,lowerbox=invisible, box align=top]
                \texttt{#1}
                \end{tcolorbox}
            }{}
        }
        \colchunk{ 
            \begin{tcolorbox}[colback=blue!05,colframe=blue!10,lowerbox=invisible, box align=top]
            #2
            \end{tcolorbox}
        }
    \end{parcolumns}
}

% --------------------- comment ---------------------------
\DeclareDocumentCommand\comment{ m }
{
    \begin{tcolorbox}[colback=black!05,colframe=black!25,floatplacement=b,float]
    Summary
    \tcblower
        #1
    \end{tcolorbox}
}


% --------------------- setup running footer ---------------------------
\def\doctype{c}
\define@key{note.cls}{doctype}[s]{%
  \def\doctype{#1}%
}



\ExecuteOptionsX{doctype}
\ProcessOptionsX%


\RequirePackage{etoolbox}
\makeatletter
\tracingpatches
\patchcmd\maketitle{
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
}{}{}{}

\AtBeginDocument{%
\if s\doctype%
    \pagestyle{fancy}%
    \fancypagestyle{plain}{INSERT YOUR DEFINITIONS}
    \ifx\@title\@empty
        \relax
    \else
        \cornelltitle{\@title}
    \fi
    \ifx\@author\@empty
        \renewcommand{\headrulewidth}{0pt}
        \renewcommand{\footrulewidth}{0pt}
    \else
        \renewcommand{\headrulewidth}{0pt}
        \renewcommand{\footrulewidth}{0.4pt}
        \fancyfoot[L]{\@author}
    \fi
    \ifx\@date\@empty
        \renewcommand{\headrulewidth}{0pt}
        \renewcommand{\footrulewidth}{0pt}
    \else
        \renewcommand{\headrulewidth}{0pt}
        \renewcommand{\footrulewidth}{0.4pt}
        \fancyfoot[R]{\@date}
    \fi
   
\else
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
\fi
}
\makeatother
\endinput

% ---------------- additional math packages ----------------------
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{hyperref}
\RequirePackage{multirow}
\RequirePackage{algorithm}
\RequirePackage[noend]{algpseudocode}
\RequirePackage{graphicx}

