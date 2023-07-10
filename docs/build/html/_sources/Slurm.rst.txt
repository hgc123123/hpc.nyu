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
   :widths: 15, 50

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

jiji
