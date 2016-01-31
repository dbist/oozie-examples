#! /usr/bin/env /usr/local/bin/python3.3
import os, pwd, sys
print("who am I? " + pwd.getpwuid(os.getuid())[0])
print("this is a Python script")
print("Python Interpreter Version: " + sys.version)
