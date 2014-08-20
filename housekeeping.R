nocfg <- function() {
  example.filename = "ohsudream-config-example.R"
  fh <- file(example.filename,"r")
  nocfg.msg <- readChar(fh,file.info(example.filename)$size)
  nocfg.msg <- paste("Please create a local config file that defines some local values, e.g:\n=========\n",nocfg.msg,sep="")
  close(fh)
  stop(nocfg.msg)
}

tryCatch(source("ohsudream-config.R"),error = function(e) nocfg())

#setwd(dream.wd)
