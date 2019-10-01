
LWdataframe <- function(path, s.year, e.year, areas, 
                        csv = TRUE, Rdata = TRUE){
  
  years <- c(s.year:e.year)
  allData <- NULL
  
  for (i in 1:length(years)){
    
    load(paste(path, "/data/lenwgt/lw", years[i],".RData",sep=""))		
    
    data.i = wt
    rm(wt)
    
    year.i = years[i]
    YEAR.i = rep(year.i, nrow(data.i))
    
    data.i = cbind(YEAR.i, data.i)
    names(data.i) = c("YEAR", "STRAT", "SPECIES", "LENGTH", "WEIGHT")
    
    allData <- rbind(allData, data.i)
    
  }
  
  # now use the defineGroups function to identify which spatial scale each strata belongs to
  # i.e., add "ID" column to data
  #source("C:/RProjects/ExtractIndicators/R/defineGroups.R")
  #areas =  c('strat','nafo','esswss','shelf')
  
  for(j in 1:length(areas)){
    
    areas.j = areas[j]
    allData_ID = defineGroups(allData, gp = areas[j])
    
    dir.create(paste(path, "/output/LengthWeight", sep = ""), recursive = T, showWarnings = F)
    path.output <- paste(path, "/output/LengthWeight/", areas.j, "_LengthWeight", sep = "")
    
    if(csv) write.csv(allData_ID, file = paste(path.output, ".csv", sep=""), row.names = FALSE)
  
    if(Rdata) save(allData_ID, file = paste(path.output, ".RData", sep=""))
    
  }
  
}