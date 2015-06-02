#!/usr/bin/env python
#-*- coding: utf-8 -*-
#										<- leave this line empty
import matplotlib 
import scipy
import matplotlib.pyplot as plt

## Initialize 
matplotlib.rc('text', usetex=True, preamble = '\usepackage{txfonts}')
matplotlib.rc('font',**{'family':'serif','serif':['Computer Modern Roman, Times']})
matplotlib.rc('text.latex',unicode=True)
colors = ("#BB3300", "#8800DD", "#2200FF", "#0099DD", "#00AA00", "#AA8800",
					   "#661100", "#440077", "#000088", "#003366", "#004400", "#554400")
plt.figure(figsize=(8,5))
#rx = 

## Load data from csv file and plot them
(x_data, y_data) = scipy.loadtxt(input_file_name, usecols=(0,1), unpack=True)
plt.plot(x_data, y_data, color=colors[0], label=u'', linewidth=1, linestyle=('-','--','-.',':')[0])

## Finish the graph 
plt.xlabel(u"Position $x_p$ [$\\muup$m]") 
plt.ylabel(u"Frequency $\\omega$ [MHz]")
#plt.xlim((, ))
plt.legend()
plt.grid()

plt.savefig(output_file_name, bbox_inches='tight')
