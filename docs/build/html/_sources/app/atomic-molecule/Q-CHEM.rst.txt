========
Q-CHEM
========

Q-Chem is an ab initio quantum chemistry software package for fast and accurate simulations of molecular systems, 
including electronic and molecular structure, reactivities, properties, and structure.

**Q-CHEM is commercial software, only authorized user can use it**

Q-CHEM Module
=============

.. csv-table::
   :header: "Version", "How to buid","Module","Cluster"
   :widths: 8,10,15,25

   "6.0","source code","q-chem/6.0","pudong(hpc.shanghai.nyu.edu)"
   "6.1","source code","q-chem/6.1","pudong(hpc.shanghai.nyu.edu)"

Test Data Dir
==============

.. code:: bash

   mkdir q-chem
   cd q-chem
   cp -r /gpfsnyuc7/xspace/sungroup/software/qchem6cpu/samples/aimd/aimd_init_veloc.in ./

How to run
==========

q-chem.slurm
-------------

.. code:: bash

   #!/bin/bash

   #SBATCH --job-name=q-chem-test
   #SBATCH --partition=parallel
   #SBATCH -N 1
   #SBATCH --ntasks-per-node=1
   #SBATCH --output=%j.out
   #SBATCH --error=%j.err
   
   cd q-chem
   module load q-chem/6.1
   qchem aimd_init_veloc.in

Q-CHEM Result
--------------

.. code:: bash

    Total job time:  1.50s(wall), 0.23s(cpu) 
    Fri Jul 14 14:11:26 2023

	   *************************************************************
	   *                                                           *
	   *  Thank you very much for using Q-Chem.  Have a nice day.  *
	   *                                                           *
	   *************************************************************

Q-CHEM References
=================

`Q-CHEM Website <https://www.q-chem.com/>`_ 
