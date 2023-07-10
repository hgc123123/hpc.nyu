======
Module
======

The Modules package is a tool that simplify shell initialization and
lets users easily modify their environment during the session with
modulefiles.

Each modulefile contains the information needed to configure the shell for
an application. Once the Modules package is initialized, the environment can
be modified on a per-module basis using the module command which interprets
modulefiles. Typically modulefiles instruct the module command to alter or
set shell environment variables such as PATH, MANPATH, etc. modulefiles may
be shared by many users on a system and users may have their own collection
to supplement or replace the shared modulefiles.

Modules can be loaded and unloaded dynamically and atomically, in an clean
fashion. All popular shells are supported, including bash, ksh, zsh, sh,
csh, tcsh, fish, as well as some scripting languages such as tcl, perl,
python, ruby, cmake and r.

Modules are useful in managing different versions of applications. Modules
can also be bundled into metamodules that will load an entire suite of
different applications.

Common Commands
===============

.. csv-table::
   :header: "Command", "Description"
   :widths: 20, 50

   "module list","List currently loaded modules."
   "module avail","List available packages."
   "module spider","List available packages in a different format."
   "module help [modulefile]","Description of specified module."
   "module show [modulefile]","Displays information about specified module, including environment changes, dependencies, software version and path."
   "module load [modulefile]","Loads module or specifies which dependencies have not been loaded."
   "module unload [modulefile]","Unloads specified module from environment."
   "module purge","Unloads all loaded modules"
