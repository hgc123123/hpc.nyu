======
Module
======

The Modules package is a tool that simplify shell initialization and
lets users easily modify their environment during the session with
modulefiles.

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

Using Common Commands
======================

module avail
------------

.. code:: bash

   [hpc@hpclogin ~]$ module avail 

   ------------------------------------------------------------------------------------- /gpfs/spack/modulefiles --------------------------------------------------------------------------------------
      oneapi/2023.1.0

   ----------------------------------------------------------------------- /gpfs/spack/share/spack/modules/linux-rhel8-icelake ------------------------------------------------------------------------
      cmake/3.26.3-gcc-8.5.0 (D)    intel-oneapi-compilers/2023.1.0    intel-tbb/2021.9.0               openmpi/main-gcc-13.1.0
      gcc/12.1.0                    intel-oneapi-mkl/2023.1.0          miniconda3/22.11.1               osu-micro-benchmarks/7.1-1-gcc-13.1.0
      gcc/13.1.0             (D)    intel-oneapi-mpi/2021.9.0          openblas/0.3.23-gcc-8.5.0 (D)    osu-micro-benchmarks/7.1-1-oneapi-2023.1.0 (D)

module spider
--------------

.. code:: bash

   [hpc@hpclogin ~]$ module spider openmpi

   ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
     openmpi: openmpi/main-gcc-13.1.0

module help
------------

.. code:: bash
   
   [hpc@hpclogin ~]$ module help openmpi

   ------------------------------------------------------------------------- Module Specific Help for "openmpi/main-gcc-13.1.0" --------------------------------------------------------------------------
   Name   : openmpi
   Version: main
   Target : icelake

   An open source Message Passing Interface implementation.

module load 
-------------

.. code:: bash

   [hpc@hpclogin ~]$ module load openmpi/main-gcc-13.1.0

module list
------------

.. code:: bash
  
   [hpc@hpclogin ~]$ module list

   Currently Loaded Modules:
     1) openmpi/main-gcc-13.1.0

module show 
------------

.. code:: bash

   [hpc@hpclogin ~]$ module show openmpi/main-gcc-13.1.0
   ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
      /gpfs/spack/share/spack/modules/linux-rhel8-icelake/openmpi/main-gcc-13.1.0:
   ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   whatis("An open source Message Passing Interface implementation.")
   conflict("openmpi")
   prepend_path("PATH","/gpfs/spack/opt/spack/linux-rhel8-icelake/gcc-13.1.0/openmpi-main-w5kotu7gsrwulvqzwdlbsemmxwwvvy3i/bin")
   prepend_path("PKG_CONFIG_PATH","/gpfs/spack/opt/spack/linux-rhel8-icelake/gcc-13.1.0/openmpi-main-w5kotu7gsrwulvqzwdlbsemmxwwvvy3i/lib/pkgconfig")
   prepend_path("CMAKE_PREFIX_PATH","/gpfs/spack/opt/spack/linux-rhel8-icelake/gcc-13.1.0/openmpi-main-w5kotu7gsrwulvqzwdlbsemmxwwvvy3i/.")
   setenv("MPICC","/gpfs/spack/opt/spack/linux-rhel8-icelake/gcc-13.1.0/openmpi-main-w5kotu7gsrwulvqzwdlbsemmxwwvvy3i/bin/mpicc")
   setenv("MPICXX","/gpfs/spack/opt/spack/linux-rhel8-icelake/gcc-13.1.0/openmpi-main-w5kotu7gsrwulvqzwdlbsemmxwwvvy3i/bin/mpic++")
   setenv("MPIF77","/gpfs/spack/opt/spack/linux-rhel8-icelake/gcc-13.1.0/openmpi-main-w5kotu7gsrwulvqzwdlbsemmxwwvvy3i/bin/mpif77")
   setenv("MPIF90","/gpfs/spack/opt/spack/linux-rhel8-icelake/gcc-13.1.0/openmpi-main-w5kotu7gsrwulvqzwdlbsemmxwwvvy3i/bin/mpif90")
   setenv("OPENMPI_ROOT","/gpfs/spack/opt/spack/linux-rhel8-icelake/gcc-13.1.0/openmpi-main-w5kotu7gsrwulvqzwdlbsemmxwwvvy3i")
   help([[Name   : openmpi
   Version: main
   Target : icelake

   An open source Message Passing Interface implementation. The Open MPI
   Project is an open source Message Passing Interface implementation that
   is developed and maintained by a consortium of academic, research, and
   industry partners. Open MPI is therefore able to combine the expertise,
   technologies, and resources from all across the High Performance
   Computing community in order to build the best MPI library available.
   Open MPI offers advantages for system and software vendors, application
   developers and computer science researchers.
   ]])  

module unload
-------------

.. code:: bash

   [hpc@hpclogin ~]$ module load openmpi
   [hpc@hpclogin ~]$ module list

   Currently Loaded Modules:
     1) openmpi/main-gcc-13.1.0

   [hpc@hpclogin ~]$ module unload openmpi/main-gcc-13.1.0
   [hpc@hpclogin ~]$ module list
   No modules loaded 

module purge
-------------

.. code:: bash

   [hpc@hpclogin ~]$ module load openmpi cmake
   [hpc@hpclogin ~]$ module list

   Currently Loaded Modules:
     1) openmpi/main-gcc-13.1.0   2) cmake/3.26.3-gcc-8.5.0

    

   [hpc@hpclogin ~]$ module purge
   [hpc@hpclogin ~]$ module list
   No modules loaded
