#! /usr/bin/env python
import os, pwd, sys
print "who am I? " + pwd.getpwuid(os.getuid())[0]
print "this is a Python script" 
print "Python Interpreter Version: " + sys.version
