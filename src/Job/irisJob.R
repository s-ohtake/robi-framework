source('src/Step/irisStep.R')

is<-IrisStep$new()
all.result<-list()
for(p in seq(0.1,0.9,by = 0.1)){
  is$Run(prob=p)
  all.result[[paste("prob=",p)]]<-is$result
}

summary(all.result)

all.result
