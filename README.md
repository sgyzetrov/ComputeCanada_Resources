# ComputeCanada_Resources

Materials related to operating on Compute Canada clusters

English version of document: [click](https://github.com/sgyzetrov/ComputeCanada_Resources/blob/master/ComputeCanada_Guides/ComputeCanada_Guides_en.md)

## Pro Tips

When we are done with the simple introductory guide above and moving further with CC servers, naturally we will encounter numerous problems. There are some useful things that I have learned so far and I would like to share with you (I will be updating this section as well as [FAQ](#faq) periodically):

1. Get a short summary of the CPU- and memory-efficiency of a completed jobs with `seff` <sup>[1](#ref1)</sup>:
   ```
   seff <jobID>
   ```
2. Find more detailed information about a completed job with `sacct`, and optionally, control what it prints using `--format` <sup>[1](#ref1)</sup>:
    ```
    $ sacct -j <jobID>
    $ sacct -j <jobID> --format=JobID,JobName,MaxRSS,Elapsed
    ```
    Use the MaxRSS accounting field to determine how much memory a job needed. The value returned will be the largest resident set size for any of the tasks. If you want to know which task and node this occurred on, print the MaxRSSTask and MaxRSSNode fields also. The `sstat` command works on a running job much the same way that `sacct` works on a completed job.
3. Want to transfer large data across different clusters (e.g. transfer 20GiB data from Graham to Beluga?)?

    Use [Globus](http://globus.computecanada.ca/) (documentation: [https://docs.computecanada.ca/wiki/Globus](https://docs.computecanada.ca/wiki/Globus))! Blazing fast transfer, we are talking 10-GiB-in-seconds fast. Forget about open two Cyberduck windows and drap-n-drop, it takes forever and your computer has to stay in wake during.

## FAQ

1. Waiting time on CC servers really long? Possible reasons:

    - Higher demand on the cluster.
    - The group has used more its share in the recent past.
    - Improperly specified or non-optimal job requests.

    N.B. Larger and longer jobs are more difficult to schedule. Breaking a job into smaller pieces by checkpointing is likely to be more important. 

    Once a job is running we can try `srun --jobid=<jobID> --pty bash` to jump into the job and then run typical *nix commands such as "top" to see resource usage. 

2. Parallel programming with the Python multiprocessing module:
   
   On a cluster, it is very important to use the cores that are allocated to your job. Launching more processes than you have cores requested will slow down your calculation and possibly overload the compute node. Launching fewer processes than you have cores will result in wasted resources and cores remaining idle. The correct number of cores to use in your code is determined by the amount of resources you requested to the scheduler <sup>[2](#ref2)</sup>.
   
   In job script try something like
   ```
   #SBATCH --cpus-per-task=4
   python cubes_parallel.py
   ```
   And in Python script try
   ```py
    import multiprocessing as mp
    import os

    def worker_func(x):
        return x**3

    ncpus = int(os.environ.get('SLURM_CPUS_PER_TASK',default=1))
    pool = mp.Pool(processes=ncpus)
    data = [1, 2, 3, 4, 5, 6]
    cubes = pool.map(worker_func, data)
    print(cubes)
   ```

## Resources

1. WestGrid scheduling training sessions and materials: [link](https://westgrid.github.io/trainingMaterials/tools/scheduling/)

## References

<span id="ref1">[1]</span> https://docs.computecanada.ca/wiki/Running_jobs#Completed_jobs<br/>
<span id="ref2">[2]</span> https://docs.computecanada.ca/wiki/Python#Parallel_programming_with_the_Python_multiprocessing_module