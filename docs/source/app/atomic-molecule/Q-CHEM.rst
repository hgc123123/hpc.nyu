========
RAPIDS
========

RAPIDS provides unmatched speed with familiar APIs that match the most popular PyData libraries. 
Built on state-of-the-art foundations like NVIDIA CUDA and Apache Arrow, it unlocks the speed of GPUs with code you already know.

Utilizing NVIDIA CUDA primitives for low-level compute optimization, RAPIDS exposes GPU parallelism and high-bandwidth memory speed through user-friendly interfaces:

.. hlist::
   :columns: 1

   * Dataframe processing with cuDF (similar API to pandas)
   * Machine learning with cuML (similar API to scikit-learn)
   * Graph processing with cuGraph (similar API to networkX)
   * Spatial analytics with cuSpatial (similar API to geoPandas) 
   * Image processing with cuCIM (similar API to scikit-image)
   * Signal processing cuSignal (similar API to scipy.signal)
   * Seamless cross-filtered dashboards with cuxfilter
   * Low level compute primitives with RAFT
   * Apache Spark acceleration with Spark RAPIDS

Modules
=======

.. csv-table::
   :header: "Version", "How to buid","Module","Cluster"
   :widths: 8,10,15,25

   "0.19","Singularity","rapids/0.19","pudong(hpc.shanghai.nyu.edu)"

Test Data 
===========

.. code:: bash

   Data: /gpfsnyuc7/packagec7/modules/rapids/tmp.csv
   
   #We only use cuDF and cuGraph here

Run in CPU vs GPU
=================

CPU
----

cpu.py
^^^^^^^^

xxxxx

GPU
---

gpu.slurm
^^^^^^^^^^

.. code:: bash

   #!/bin/bash

   #SBATCH --job-name=gpu_cudf_cugraph
   #SBATCH --partition=gpu
   #SBATCH -N 1
   #SBATCH --ntasks-per-node=4
   #SBATCH --gres=gpu:1
   #SBATCH --output=%j.out
   #SBATCH --error=%j.err
   
   module load singularity/3.11.3   rapids/0.19
   python3 gpu.py

gpu.py
^^^^^^^

.. code:: bash

   import cudf
   import cugraph

   # Load edge list from a CSV file
   edge_list = cudf.read_csv('tmp.csv', header=None)
   edge_list.columns = ['source', 'destination', 'weight']

   # Create a Graph
   G = cugraph.Graph()
   G.from_cudf_edgelist(edge_list, source='source', destination='destination', edge_attr='weight')

   # Calculate betweenness centrality
   betweenness_centrality = cugraph.betweenness_centrality(G)

   #print(betweenness_centrality)
   betweenness_centrality.to_csv('betweenness_centrality.csv', index=False) 

Submit GPU job
^^^^^^^^^^^^^^^

.. code:: bash

   sbatch gpu.slurm

Result
======

.. csv-table::
   :header: "Enviroment", "Time"
   :widths: 10,10

   "CPU","xx:xx:xx"
   "GPU(1:P100)","00:01:34"

RAPIDS References
=================

`RAPIDS Website <https://rapids.ai/>`_

