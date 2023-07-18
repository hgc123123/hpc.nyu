========
Amber
========

Amber is a suite of biomolecular simulation programs.
It is a set of molecular mechanical force fields for the simulation of biomolecules (these force fields are in the public domain, and are used in a variety of simulation programs).

Amber Module
=============

.. csv-table::
   :header: "Version", "How to buid","Module","Cluster"
   :widths: 4,10,25,20

   "18","source code","amber/18-openmpi-5.1.0-gcc-8.5.0","nyushc(hpclogin.shanghai.nyu.edu)"

Amber running example
=====================

.. code:: bash

   mkdir ~/amber
   cd ~/amber
   cp -r /gpfsnyu/spack/opt/spack/linux-rhel8-icelake/contribute/amber18/benchmarks/gb_mb ./


How to run amber
================

amber.slurm
------------

.. code:: bash

   #!/bin/bash

   #SBATCH --job-name=amber
   #SBATCH --partition=parallel
   #SBATCH -N 1
   #SBATCH --ntasks-per-node=36
   #SBATCH --nodelist=compute[142]
   #SBATCH --output=%j.out
   #SBATCH --error=%j.err
   
   module load openmpi/main-gcc-8.5.0  amber/18-openmpi-5.1.0-gcc-8.5.0 
   cd ~/amber
   ulimit -l unlimited
   mpirun -np 36 pmemd.MPI -O -i bench.gb_mb -o mdout -p prmtop -c inpcrd

**sbatch amber.slurm**

Amber Running Result
====================

.. code:: bash

   |  Final Performance Info:
   |     -----------------------------------------------------
   |     Average timings for last     800 steps:
   |     Elapsed(s) =       2.41 Per Step(ms) =       3.01
   |         ns/day =      28.70   seconds/ns =    3010.00
   |
   |     Average timings for all steps:
   |     Elapsed(s) =       3.07 Per Step(ms) =       3.07
   |         ns/day =      28.12   seconds/ns =    3072.43
   |     -----------------------------------------------------

   |  Master Setup CPU time:            0.53 seconds
   |  Master NonSetup CPU time:         3.06 seconds
   |  Master Total CPU time:            3.59 seconds     0.00 hours

   |  Master Setup wall time:           2    seconds
   |  Master NonSetup wall time:        3    seconds
   |  Master Total wall time:           5    seconds     0.00 hours

Amber References
=================

`Amber Website <http://ambermd.org//>`_ 
