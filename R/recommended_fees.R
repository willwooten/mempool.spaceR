
recommended_fees <- function (){
  url <- "https://mempool.space/api/v1/fees/recommended"
  
  list <- jsonlite::fromJSON(url)
  
  df <- data.frame(
    fastest_fee = list$fastestFee, 
    half_hour_fee = list$halfHourFee, 
    hour_fee = list$hourFee, 
    minimum_fee = list$minimumFee)
  
  df
}
