source("src/ItemWriter/IrisWriter.R")
source("src/ItemReader/IrisReader.R")
source("src/ItemProcessor/IrisProcessor.R")
source("src/Model/IrisModel.R")

IrisStep <- R6Class(
  classname = "IrisStep",
  portable = FALSE,
  public   = list(
    ir=NA,
    prob=NA,
    result=list(),
    initialize=function(){
      prob<<-prob
      Reader<<-IrisReader$new()
      Processor<<-IrisProcessor$new()
      Writer<<-IrisWriter$new()
      Model <<-IrisModel$new()
      
    },
    Run=function(prob=NA){
      prob<<-prob
      
      StepRead()

      print(paste0('train:',nrow(Processor$train)))
      print(paste0('test:',nrow(Processor$test)))
      
      StepSvm()
      StepNnet()
      StepNb()
      StepWrite()
      print('end Iris step')
    },
    StepRead=function(){
      # Item read
      print("read")
      ir.d<-Reader$ItemRead()
      Processor$ItemSampling(ir.d,prob)
      
    },
    StepSvm=function(){
      print("StepSvm")
      # train
      svm.res<-Model$PredictSvm(Processor$train,Processor$test)
      # predict
      result[['Svm']]<<-table(svm.res,Processor$test$Species)
    },
    StepNnet=function(){
        # train
      print("StepNnet")
      
      nnet.res<-Model$PredictNnet(Processor$train,Processor$test)
      # predict
      result[['Nnet']]<<-table(nnet.res,Processor$test$Species)
     
    },
    StepNb=function(){
      # train
      print("SteNnet")
      
      nb.res<-Model$PredictNb(Processor$train,Processor$test)
      # predict
      result[['Nb']]<<-table(nb.res,Processor$test$Species)
      
    },
    StepWrite=function(){
      filename=paste0('iris_',prob,'.txt')
      Writer$ItemWrite(result,filename)
    }
  )    
)

