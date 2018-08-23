IrisWriter <- R6Class(
  classname = "irisWriter",
  inherit   = Item,
  public   = list(
    ItemWrite = function(data,filename) {
      write.list(data,file=paste0('data/',filename))
    }
  )
  
)
