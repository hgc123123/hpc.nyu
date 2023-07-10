========
Rapids
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
--------

.. csv-table::
   :header: "Version", "How to buid","Module","Cluster"
   :widths: 8,10,15,25

   "0.19","Singularity","rapidsai/0.19","pudong(hpc.shanghai.nyu.edu)"
