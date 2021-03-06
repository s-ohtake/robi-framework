# This script is a superclass of ItemReader and ItemWriter
Item<-R6Class(
  classname="Item",
  public = list(
    con    = NA,
    # constractor
    DdConnect = function(schema=NA) {
        driver <-JDBC(Sys.getenv('REDSHIFT_DRIVER'),Sys.getenv('REDSHIFT_DRIVER_PATH'), identifier.quote="`")
        self$con<-dbConnect(driver,Sys.getenv('JDBC_URL'))
        if(!is.na(schema)){
          dbSendUpdate(self$con,paste0('set search_path to ',schema))
        }
    },
    DdDisconnect=function(){
        dbDisconnect(self$con)
    },
    DdGetQuery=function(sql,mode=NA){
        return(dbGetQuery(self$con, sql))
    },
    DdUpdateQuery=function(sql){
        return(dbGetQuery(self$con, sql))
    },
    # Sqlファイルから読み込む
    ScanQuery = function(query_path) {
        return (
          scan(query_path, what='', quote='', sep='\n', comment.char = '', fileEncoding='UTF-8') %>% 
            #gsub(pattern='--.*$', replacement='') %>% # 正規表現でコメントアウトを消す
            # paste0(collapse=' ')
            paste(collapse='\n')
        )
    },
    BindParam=function(tx,from,to,num=1){
      if(length(from) != length(to)) stop("not match length!!")
      if(length(from) < num) return(tx)
      Recall(gsub(from[num],to[num],tx),from,to,num+1)
    },
    finalize = function() {
      self$DdDisconnect()
    }
    
 )
)