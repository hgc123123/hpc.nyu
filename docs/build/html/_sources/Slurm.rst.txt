======
Slurm
======

Slurm is an open source, fault-tolerant, and highly scalable cluster management and job scheduling system for large and small Linux clusters. We use Slurm as resource scheduler in two clusters.

Basic commands
==============

+----------+------------------------------------------------------------------------------+
| Command  |                      Description                                             |
+==========+==============================================================================+
| sbatch   | submit a job script for later execution                                      |
+----------+------------------------------------------------------------------------------+
| scancel  | cancel a pending or running job or job step                                  |
+----------+------------------------------------------------------------------------------+
| sacct    | report job or job step accounting information about active or completed jobs |
+----------+------------------------------------------------------------------------------+
| scontrol | view and/or modify Slurm state                                               |
+----------+------------------------------------------------------------------------------+
| sinfo    | reports the state of partitions and nodes managed by Slurm                   |
+----------+------------------------------------------------------------------------------+
| squeue   | reports the state of jobs or job steps                                       |
+----------+------------------------------------------------------------------------------+
| srun     | submit a job for execution or initiate job steps in real time                |
+----------+------------------------------------------------------------------------------+

squeue
-------

.. csv-table::
   :header: "Command", "Description"
   :widths: 15, 30

   "squeue -j jobid","print infomation about job jobid"
   "squeue -n HOST","print information about job running on HOST"

How to run jobs
===============

**Frequented parameters**

.. csv-table::
   :header: "Parameter", "Description"
   :widths: 24, 50

   "-n [count]","total processes"
   "--ntasks-per-node=[count]","total processed per node"
   "-p [partition]","partition name"
   "--job-name=[name]","job name"
   "--output=[file_name]","output result log"
   "--error=[file_name]","ouput error log"
   "--time=[dd-hh:mm:ss]","limited time of the job allocation"
   "--mail-type=[type]","Notify user by email when certain event types occur"
   "--mail-user=[mail_address]","User to receive email notification of state changes as defined by --mail-type"
   "--nodelist=[nodes]","Request a specific list of hosts"
   "--exclusive=[nodes]","The job allocation can not share nodes with other running jobs"
   "--array=[array_spec]","Submit a job array, multiple jobs to be executed with identical parameters"
   "--gres=gpu:numbers","Specifies a comma-delimited list of generic gpu resources"

Sbatch
-------

Sbatch submits a batch script to Slurm. The batch script can be given to sbatch through a file name on the command line. The batch script may contain options preceded with "#SBATCH" before any executable commands in the script. sbatch will stop processing further #SBATCH directives once the first non-comment non-whitespace line has been reached in the script.


1.Create a file
^^^^^^^^^^^^^^^^^^^^^^^

.. code:: bash

   touch run.slurm

2.Applied resources
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``If you want to run software with GPU node``

.. code:: bash

   #!/bin/bash

   #SBATCH --job-name=gpu
   #SBATCH --partition=gpu
   #SBATCH -n 1                  #total nodes
   #SBATCH --ntasks-per-node=1   #total processes per node
   #SBATCH --gres=gpu:1          #total gpus
   #SBATCH --time=10:00:00
   #SBATCH --output=%j.out
   #SBATCH --error=%j.err

   mpirun exec.file

``If you want to run software with multiple node``

.. code:: bash

   #!/bin/bash

   #SBATCH --job-name=mpi
   #SBATCH --partition=parallel
   #SBATCH -N 2                  #total nodes
   #SBATCH --exclusive
   #SBATCH --time=10:00:00
   #SBATCH --output=%j.out
   #SBATCH --error=%j.err

   mpirun exec.file


3.Submit batch script
^^^^^^^^^^^^^^^^^^^^^^

.. code:: bash

   sbatch run.slurm

Srun
-----

Run a parallel job on cluster managed by Slurm. If necessary, srun will first create a resource allocation in which to run the parallel job.

**Running example**

.. code:: bash

   srun --partition=parallel  --nodes=1 --ntasks=6 hostname

Advice From Manager
===================

We hope that you can use sbatch to submit jobs, you just need to submit your job to backend, and then you can close you termimal freely.
If you use srun to running job, when you terminal are closed, your job will be cancelled.

Steps to submit job
^^^^^^^^^^^^^^^^^^^

``Firstly,``
enter computer node

.. code:: bash

   srun -p debug -N 1 -n 1 --time=10:00:00 --pty /bin/bash

``Secondly,``
edit your script with some resources

----run.slurm----
.. code:: bash

   #!/bin/bash

   #SBATCH --job-name=mpi
   #SBATCH --partition=parallel
   #SBATCH -N 1                  
   #SBATCH --ntasks-per-node=32
   #SBATCH --time=10:00:00
   #SBATCH --output=%j.out
   #SBATCH --error=%j.err

   mpirun exec.file

``Thirdly,``
submit job to cluster

.. code:: bash

   sbatch run.slurm

References
==========

`Slurm Website <https://slurm.schedmd.com/documentation.html>`_
