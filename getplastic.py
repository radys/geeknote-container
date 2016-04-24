#! /usr/bin/env python

from urllib2 import urlopen
from StringIO import StringIO
from tarfile import open as tarOpen
from os.path import sep, join
from os import mkdir

DIR="/root/.vim"
try:
    mkdir(DIR)
except OSError:
    pass

tar = tarOpen(fileobj=StringIO(urlopen("https://github.com/plasticboy/vim-markdown/archive/master.tar.gz").read()),
	mode="r:gz")

# This function imitates tar's --strip=1 option and filters out unneccessary stuff
def strip_1(members):
    for x in members:
        sp = x.name.split(sep, 2)
	if len(sp) <= 1:
	    continue
	n = sp[1]
	if n.endswith(".md") or n in ("Makefile", "test"):
            continue
        x.name = apply(join, sp[1:])
        yield x

tar.extractall(members=strip_1(tar), path=DIR)
