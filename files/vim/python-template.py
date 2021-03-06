#!/usr/bin/python3  
#-*- coding: utf-8 -*-

## Import common moduli
import matplotlib, sys, os, time, collections
from pathlib import Path
import matplotlib.pyplot as plt
import numpy as np
#from scipy.constants import c, hbar, pi

## Use LaTeX (optional)
# matplotlib.rc('text', usetex=True)
# matplotlib.rc('font', size=8)
# matplotlib.rc('text.latex', preamble = r'\usepackage{amsmath}, \usepackage{yfonts}, \usepackage{txfonts}, \usepackage{lmodern},')

fig, ax = plt.subplots(nrows=2, ncols=1)

## Load data
#x,y = np.loadtxt(sys.argv[1], unpack=True)

# == Plotting with object model==
fig, ax = plt.subplots(nrows=1, ncols=1, figsize=(7, 7))
#ax.plot(x, y); 


## ==== Outputting ====
## Simple axes
ax.ylim((-0.1,1.1)); plt.yscale('linear')
ax.xlim((-0.1,1.1)); plt.xscale('linear')
ax.xlabel(u"x"); 
ax.ylabel(u"y"); 
ax.grid()
ax.legend(prop={'size':10}, loc='upper right')

## Show or save
ax.savefig("output.png", bbox_inches='tight')

#np.savetxt(sys.argv[1]+"_corrected.dat", np.array([]).T)

fig.tight_layout()
fig.canvas.mpl_connect('close_event', quit);  fig.show()
