## Returns a dataframe of current recommended fee 
## levels for fastest, half-hour and hour time frames
## and also minimum fee currently being kept in 
## the mempool 

recommended_fees <- function(){
  url <- "https://mempool.space/api/v1/fees/recommended"
  list <- jsonlite::fromJSON(url)
  
  data.frame(
    fastest_fee = list$fastestFee, 
    half_hour_fee = list$halfHourFee, 
    hour_fee = list$hourFee, 
    minimum_fee = list$minimumFee)
}