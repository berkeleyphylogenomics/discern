#!/usr/bin/python
#a pymol script to visulize the pocket sites
from pymol import cmd
cmd.load("12as.pdb")
cmd.color("green")
cmd.hide()
cmd.show("surface")
cmd.load("pocket.pdb")
cmd.set("sphere_scale",0.8)
cmd.show("sphere","pocket")
cmd.color("red","pocket")
cmd.deselect()
cmd.zoom()
