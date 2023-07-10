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
