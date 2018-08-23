IrisReader <- R6Class(
  classname = "irisReader",
  inherit   = Item,
  public   = list(
    ItemRead = function() {
      return(iris)
      
    }
  )
  
)
