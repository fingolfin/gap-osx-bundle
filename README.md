GAP OSX bundle
==============

This project aims to provide a framework for easily creating a precompiled
binary release of GAP for Mac OS X, in the form of an .app package
distributed inside a .dmg disk image. User should be able to install
it via drag & drop, and start it by double clicking the .app bundle.
Advanced users should be able to start GAP from a running terminal, too.

In addition, most (ideally, all) GAP packages shipped with GAP should work;
that means that any C/C++ code they contain should be compiled, and
required dependencies also be included in the bundle.

As a by product, the bundle actually contains fully working copies of
some interactive mathematical software of independent interest, including
* Singular
* Pari
* Normaliz
Thus, in a sense, this is not just a "GAP bundle", but rather a
bundle of research grade computer algebra software.

Note that this project is still work in progress, not everything is 
working yet. Most notably, GAP itself and several GAP packages are
not yet completely done.



Requirements
============
At least the following software must be installed on your system in
order to create the bundle:
* Xcode command line tools (i.e. the C/C++ compilers and assorted tools)
* cmake
* GNU autoools: automake, autoconf, libtool

Xcode can be installed via the App store. You then still need to install
the command line tools. On Mac OS X 10.9 and with Xcode 5.1, simply run

    xcode-select --install

from the command line.  If that fails, the following instructions may help:
* https://guide.macports.org/chunked/installing.html#installing.xcode
* http://stackoverflow.com/questions/9329243

The other stuff can be installed via [Fink](http://finkproject.org/),
[MacPorts](https://www.macports.org/) or [Homebrew](http://brew.sh/).

If you are using Fink, use this command:

    fink install cmake autoconf2.6 automake1.14 libtool2

If you are using MacPorts, use this command:

    port install cmake autoconf automake libtool

If you are using Homebrew, use this command:

    brew install cmake autoconf automake libtool


Building the bundle
===================
Clone this repository, go into the directory, and enter

    make gap

Then wait... this can take quite some time. It will download the
required source code (almost 400 MB), and then compile a lot of stuff.
The result is an .app bundle `GAP.app` which you can move around and
double click to start GAP.

To create a disk image for distribution to end users, enter

    make dmg


How it works
============
The primary challenge to overcome is that most UNIX software is not
written with the possibility of binaries and shared libraries being
able to relocate. That said, a lot of software can be coaxed into
supporting that. The primary tool we use for this is the
  `fix_install_names.sh`
script which in turn uses Apple's `install_name_tool`.


TODO: explain what `fix_install_names.sh` does

TODO: explain how the "packages" in subdirectories work, and how to
 add new packages


Related work
============
The Polymake project also has a similar effort, the
[polybundle](https://github.com/polymake/polybundle).

Max Neunhöffer's [Bob](https://github.com/gap-system/bob)
is a project that in a sense works dual to what we do:
Instead of precompiling things, it downloads source code
on the user's computer and attempts to compile everything
there.


Bug reports and feature requests
================================
Please submit bug reports and feature requests via our GitHub issue tracker:

  https://github.com/fingolfin/gap-osx-bundle

