#!/usr/bin/python3
#-*- coding: utf-8 -*-

## Import common moduli
import matplotlib, sys, os, time
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
from scipy.constants import c, hbar, pi

## Use LaTeX
matplotlib.rc('text', usetex=True)
matplotlib.rc('font', size=8)
matplotlib.rc('text.latex', preamble = '\usepackage{amsmath}, \usepackage{yfonts}, \usepackage{txfonts}, \usepackage{lmodern},')

# TODO use object model
#fig.canvas.mpl_connect('close_event', handle_close)



## Simple axes
plt.ylim((-0.1,1.1)); plt.yscale('linear')
plt.xlim((-0.1,1.1)); plt.xscale('linear')

## ==== Outputting ====
## Finish the plot + save 
plt.xlabel(u"x"); 
plt.ylabel(u"y"); 
plt.grid()
plt.legend(prop={'size':10}, loc='upper right')
plt.savefig("output.png", bbox_inches='tight')
