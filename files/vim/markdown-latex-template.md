---
title: Prezentace

author: Filip Dominec\

    FZÚ AVČR
date: \today
fontsize: 8pt
classoption: aspectratio=169    
header-includes: |
    \usetheme{Boadilla} \useinnertheme{rectangles} \beamersetleftmargin{3mm} \beamersetrightmargin{3mm}
    \definecolor{myblue}{rgb}{0.000, 0.176, 0.447} \definecolor{myblue2}{rgb}{0.000,0.447,0.808}
    \usecolortheme[named=myblue]{structure} \hypersetup{colorlinks=true, linkcolor=myblue, urlcolor=myblue, breaklinks=true}
    \usepackage{ragged2e, multicol, appendixnumberbeamer, parskip, xcolor} \newcommand{\parcfg}{\parskip .8em \justifying }
    \newcommand{\appendices}{ \end{frame} \appendix \begin{frame}<0| handout:0>}   \newcommand{\s}{\vspace{5cm}\Huge }
    \newcommand{\cb}{\vspace{-3mm}\begin{columns} } \newcommand{\ce}{ \end{columns}} \newcommand{\col}{\column[t]{.5\textwidth} \parcfg }
    \newcommand{\coln}{\column[t]{.4\textwidth} \parcfg } \newcommand{\colw}{\column[t]{.6\textwidth} \parcfg }
    \newcommand{\colnn}{\column[t]{.333\textwidth} \parcfg } \newcommand{\colww}{\column[t]{.666\textwidth} \parcfg }
    \newcommand{\xs}{\footnotesize} \newcommand{\xxs}{\scriptsize}  \newcommand{\vs}{\vspace{.5em}} 
    \newcommand{\hr}{\vspace{.5em}\vfill \hrule } \newcommand{\ra}{$\rightarrow\,$} \newcommand{\la}{$\leftarrow$}  \newcommand{\n}{\newline}
---

# Frame 1

Text with a link [example](http://example.com), *italic* and **bold**.

Basically, any latex syntax shall be passed by pandoc.  An equation follows. 

$$ f(a)=\frac{1}{2\pi i} $$

### A block
A block is useful e.g. for a list (a list shall be separated by an empty line):

* with an item
* and another item

# Images
Three images in a row, equally spaced. Put optional label in brackets, file name in the paretheses. To simplify the latter, press ctrl+F to auto-complete name in Vim; finally adjust heights to scale image row properly.
![](example.){height=35%}
\hfill
![](){height=35%}
\hfill
![](){height=35%}

Single image (last three characters ensure it would not become a labelled figure)
![](filename.jpg){width=95%}$~$

# Images in a table
Putting images in a table allows multiple captions, the syntax is a bit awkward, though. Adjust the middle line length if latex wraps the images.

| ![](filename.jpg){height=5cm} | ![](filename.jpg){height=5cm} | ![](filename.jpg){height=5cm}|
|:------------------------------:|:------------------------------:|:------------------------------:|
| comment1 | comment2 | comment3 |

# Other tricks


Text with a footnote[^1]

[^1]: Author, Title, Paper, (year) 

Pythonic code can be easily highlighted!

```python
def foo():
    return 'bar'

```

Finally, you compile all into a PDF with pandoc. The best is to put this line into .bashrc file:

```
pan() { pandoc -f markdown+tex_math_single_backslash -t beamer   --latex-engine=pdflatex -o ${1%.md}.pdf $1; }
```


# Yet other tricks 

See the local link e.g. to [Images in a table](#images-in-a-table).

Indirect link - see [my website].

[my website]: http://foo.bar.baz

Here^[Inline note] is a bottom note with inline format.

H~2~O is a liquid.  2^10^ is 1024

This is		a simple	table
----		-----		-----
12			342			324
12			342			324

<!-- note

 -->


All LaTeX syntax available: $$ \frac{a}{b} \cos \varphi $$

