#!/usr/bin/env python
# -*- encoding: utf-8 -*-
import numpy as np
from optparse import OptionParser

def command_line_arg():
    usage = "usage: %prog [options] arg1 arg2"
    par = OptionParser(usage=usage)
    par.add_option('-i','--input',
                    action= 'store', type = 'int', dest= 'film',
                    default= '123',
                    help= 'directory of the splitted PDB files')
    return par.parse_args()

def inputGro(path):
    with open(path, 'r') as file:
        lines = file.readlines()
    solLst = []
    for line in lines:
        lineLst = line.strip().split()
        if 'SOL' not in lineLst[0]:
            continue
        if 'OW' not in lineLst[1]:
            continue
        solLst.append([float(lineLst[-6]),float(lineLst[-5])])
    return solLst

def counTer(xsize, ysize):
    solNum = len(solLst)
    xmin = xsize[0]
    xmax = xsize[1]
    ymin = ysize[0]
    ymax = ysize[1]
    counter = 0
    for i,j in solLst:
        if xmin < i <= xmax and ymin <= j < ymax:
            counter += 1
    counter = counter/solNum
    return counter

nameLst = ['para1' ,'para2' ,'para3' ,'para4' ,'para5' ,'para6' ]
opts, args = command_line_arg()
i = opts.film
p = './' + str(i) +'/'
print(p)
for i in nameLst:
    solLst = inputGro(p + i + '/prod.gro')
    numDensity = []
    for i in np.arange(0, 10, 2.5):
        for j in np.arange(0, 10, 2.5):
            numDensity.append(counTer([i,i+2.5], [j, j+2.5]))
    dnumDensity = max(numDensity) - min(numDensity)
    if dnumDensity > 0.11 :
        print('Broken')
    else:
        print('Intact')