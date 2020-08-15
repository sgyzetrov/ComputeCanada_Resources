# ComputeCanada_Resources

Materials related to operating on Compute Canada clusters

English version of document: [click](https://github.com/sgyzetrov/ComputeCanada_Resources/blob/master/ComputeCanada_Guides/ComputeCanada_Guides_en.md)

## Pro Tips

When we are done with the simple introductory guide above and moving further with CC servers, naturally we will encounter numerous problems. There are some useful things that I have learned so far and I would like to share with you (I will be updating this section as well as [FAQ](#faq) periodically):

1. Get a short summary of the CPU- and memory-efficiency of a completed jobs with `seff` <sup>[1](#1-httpsdocscomputecanadacawikirunning_jobscompleted_jobs)</sup>:
   ```
   seff <jobID>
   ```
2. Find more detailed information about a completed job with `sacct`, and optionally, control what it prints using `--format` <sup>[1](#1-httpsdocscomputecanadacawikirunning_jobscompleted_jobs)</sup>:
    ```
    $ sacct -j <jobID>
    $ sacct -j <jobID> --format=JobID,JobName,MaxRSS,Elapsed
    ```
    Use the MaxRSS accounting field to determine how much memory a job needed. The value returned will be the largest resident set size for any of the tasks. If you want to know which task and node this occurred on, print the MaxRSSTask and MaxRSSNode fields also. The `sstat` command works on a running job much the same way that `sacct` works on a completed job.

## FAQ

1. Waiting time on CC servers really long? Possible reasons:

    - Higher demand on the cluster.
    - The group has used more its share in the recent past.
    - Improperly specified or non-optimal job requests.

    N.B. Larger and longer jobs are more difficult to schedule. Breaking a job into smaller pieces by checkpointing is likely to be more important. 

    Once a job is running we can try `srun --jobid=<jobID> --pty bash` to jump into the job and then run typical *nix commands such as "top" to see resource usage. 

2. TBA

## Resources

1. WestGrid scheduling training sessions and materials: [link](https://westgrid.github.io/trainingMaterials/tools/scheduling/)

## References

#### [1] https://docs.computecanada.ca/wiki/Running_jobs#Completed_jobs