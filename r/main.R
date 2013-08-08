
dyn.load(paste("build/example", .Platform$dynlib.ext, sep=""))
source("build/example.R")
cacheMetaData(1)

print(fact(5))
