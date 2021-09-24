---
title: LaTeX+Beamer+Pandoc\

   typesetting presentations with markdown\

  --\

  _or, how to avoid complex syntax\

  yet retain the latex+beamer power_
author: Filip Dominec\

  FZÚ AVČR
date: \today
fontsize: 10pt
header-includes:
- \usetheme{Boadilla} 
- \definecolor{myblue}{rgb}{0.000, 0.176, 0.447} \definecolor{myblue2}{rgb}{0.000,0.447,0.808}
- \usecolortheme[named=myblue]{structure} \hypersetup{colorlinks=true, linkcolor=myblue, urlcolor=myblue, breaklinks=true}
- \beamersetleftmargin{3mm} \beamersetrightmargin{3mm}
- \setbeamertemplate{navigation symbols}{\insertframenumber}
- \usepackage{ragged2e} \apptocmd{\frame}{}{\justifying}{}
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

[//]: ( Comment: separate the reference contents with at least one blank line )

Pythonic code can be easily highlighted!

```python
def foo():
    return 'bar'

```

Finally, you compile all into a PDF with pandoc. The best is to put this line into .bashrc file:

```
pan() { pandoc -f markdown+tex_math_single_backslash -t beamer   --latex-engine=pdflatex -o ${1%.md}.pdf $1; }
```
