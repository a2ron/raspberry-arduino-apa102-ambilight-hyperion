#!/usr/bin/python

# H: sys.argv[1] -> [0,360]
# S: sys.argv[2] -> [0,1]
# L: sys.argv[3] -> [0,1]

import sys
import colorsys
for (r,g,b) in [colorsys.hls_to_rgb(float(sys.argv[1])/360,float(sys.argv[3]),float(sys.argv[2]))]:
    print '%02x%02x%02x' % (int(r*255), int(g*255), int(b*255))