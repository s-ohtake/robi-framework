library(kernlab)
library( nnet )
library( e1071 )
IrisModel <- R6Class(
  classname = "ItemModel",
  public   = list(
    iris.svm=NA,
    iris.nnet=NA,
    iris.nb=NA,
    PredictSvm = function(train.d,test.d) {
      iris.svm<<-ksvm(Species ~., data=train.d )
      return(predict(iris.svm, test.d))
    },
    PredictNnet = function(train.d,test.d) {
      iris.nnet<<-nnet(Species ~ ., data = train.d, size = 2, rang = .1, decay = 5e-4, maxit = 200,trace=F)
      return(predict(iris.nnet,test.d,type="class"))
    },
    PredictNb=function(train.d,test.d){
      iris.nb<<-naiveBayes(Species ~ ., data = train.d)
      return(predict(iris.nb,test.d,type="class"))

    }
  )
  
)

