## Returns current count of unconfirmed transactions

unconfirmed_transactions_count <- function(){
  url <- "https://mempool.space/api/mempool"
  df <- fromJSON(url)
  df$count
}
