---
title: On replacing the over-verbose \LaTeX\  syntax \

  with markdown\

  _to save your time\

  yet keep all the power of latex-beamer_
author: Filip Dominec\

  FZÚ AVČR
date: \today
fontsize: 10pt
header-includes:
- \usefonttheme{serif} \usepackage{palatino,upgreek}
- \usetheme{Boadilla} 
- \definecolor{myblue}{rgb}{0.000, 0.176, 0.447} \definecolor{myblue2}{rgb}{0.000,0.447,0.808}
- \usecolortheme[named=myblue2]{structure} \hypersetup{colorlinks=true, linkcolor=myblue, urlcolor=myblue, breaklinks=true}
- \beamersetleftmargin{3mm} \beamersetrightmargin{3mm}
- \setbeamertemplate{navigation symbols}{\insertframenumber}
---

## Contents

| | | |
|-|-|-|
|__Bold Key__| Value1 |
| Normal Key | Value2 |

- Bullets
    - subitem *oeucaohusano* chuaosh **eua** sochue ~saouh~
	- another 30 $\upmu$m



# Introduction


## First sub Slide

> A quoted paragraph \
> A quoted paragraph inside a quotation [text to link](http://example.com/)

## 2nd sub Slide
![**num** results](01_diel_eps09_blend0u_r.png){      height=32% } 
![screenshot](2017-07-17-111812_1920x1080_scrot.png){ height=32% }



# Full-width image 
![](2017-07-17-111812_1920x1080_scrot.png){width=100%}



# Third slide
| ![VideoBlocks](01_diel_eps09_blend0u_r.png){height=1cm}  | ![AudioBlocks](01_diel_eps09_blend0u_r.png){height=1cm} | ![GraphicStock](01_diel_eps09_blend0u_r.png){height=12mm} |
|:---:|:---:|:---:|
| table with images | table with images | table with images |


- First topic
    1. Some text with a footnote[^1].
    1. Link to external website like [github](http://github.com) needs specification of 
		* text
		* address
    1. Link to a slide is autogenerated [Heading IDs](#Eqs)
- Another topic

[^1]: The linked footnote appears at the end of the document.

# Eqs
Full support for \LaTeX\  equations:
$${e}^{i\pi }+1=q\sum_{i=0}^N x_i$$

Traditional markdown tables

| temperature | conductivity |
| ----:	      | :----        |
| 15   	      |    32.34242          |
| 20   	      |   324.2393        |
| 30   	      | 93992.93290       |
| 45   	      | NaN    |

Simple markdown table format where whitespace matters:

  Right   Left     Center   Default 
---       -----   --------  --- 
     12   12        hmmm        12 
    123   123        123       123 
      1   1            1         1


# More on markdown tables

Fancy table:

+---------------+---------------+--------------------+
| Fruit         | Price         | Advantages         |
+===============+===============+====================+
| Bananas       | $1.34         | - built-in wrapper |
|               |               | - bright color     |
+---------------+---------------+--------------------+
| Oranges       | $2.10         | - cures scurvy     |
|               |               | - tasty            |
+---------------+---------------+--------------------+




# Slide Title


\begin{table}[ht]   \caption{}  \label{tb_} \centering 
\begin{tabular}{lcr}
 ioa &	&	\\
 & 3929	&	\\
 &	& TETETOTE	\\
 \end{tabular} \end{table}

haouc soe uasochuet uascehuas uahu




# Using code blocks
On Linux with ```pdflatex``` installed, you may want to copy the following command:

    pan() { pandoc -f markdown+tex_math_single_backslash 
      -t beamer --latex-engine=pdflatex -o ${1%.md}.pdf $1; }

into the [~/.bashrc](https://superuser.com/questions/49289/what-is-the-bashrc-file) file. 

\ 
 
\hrule

```python
# Pythonic code can be easily highlighted!
def foo():
    return 'bar'
```


[//]: ( This is also a comment.)


[//]: (this is a comment) 