rm(list=ls(all=TRUE))
time1 <- Sys.time()
print(time1)
args <- commandArgs(trailingOnly = TRUE) # 接受命令行用户输入参数
seed=as.numeric(args[1]) # 把第一个用户参数传给seed
#if (length(args)>0) for(i in 1:length(args)) eval(parse(text=args[[i]]))

cat(paste(" Seed =", seed,"\n") )  # The random seed

set.seed(seed)

seedTestArray <- c()

for(i in 1:5){
	seedTestArray<-c(seedTestArray, seed^i)
}
# 需要修改路径
save(seedTestArray, file=paste0("/home/username/projects/d****h/username/Results/seedTestRun.",seed,".rda"))
time2<-Sys.time()
print(time2-time1)
q(save="no")
