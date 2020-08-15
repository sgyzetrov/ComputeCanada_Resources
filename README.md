# ComputeCanada_Resources

Materials related to operating on Compute Canada clusters

English version of document: [click](https://github.com/sgyzetrov/ComputeCanada_Resources/blob/master/ComputeCanada_Guides/ComputeCanada_Guides_en.md)

## FAQ

1. Waiting time on CC servers really long? Possible reasons:

- Higher demand on the cluster.
- The group has used more its share in the recent past.
- Improperly specified or non-optimal job requests.

N.B. Larger and longer jobs are more difficult to schedule. Breaking a job into smaller pieces by checkpointing is likely to be more important. 

Once a job is running we can try `srun --jobid=<jobid> --pty bash` to jump into the job and then run typical *nix commands such as "top" to see resource usage. 

2. TBA

## Resources

1. WestGrid scheduling training sessions and materials: [link](https://westgrid.github.io/trainingMaterials/tools/scheduling/)