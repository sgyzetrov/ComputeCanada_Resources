rm(list=ls(all=TRUE))
time1 <- Sys.time()
print(time1)
args <- commandArgs(trailingOnly = TRUE) # take command argument (user input) into variable args
seed=as.numeric(args[1]) # passing user's first argument to variable seed
#if (length(args)>0) for(i in 1:length(args)) eval(parse(text=args[[i]]))

cat(paste(" Seed =", seed,"\n") )  # The random seed

set.seed(seed)

seedTestArray <- c()

for(i in 1:5){
	seedTestArray<-c(seedTestArray, seed^i)
}
# Note: remember to change path!
save(seedTestArray, file=paste0("/home/username/projects/d****h/username/Results/seedTestRun.",seed,".rda"))
time2<-Sys.time()
print(time2-time1)
q(save="no")
