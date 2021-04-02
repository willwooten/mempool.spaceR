## Returns full list of txids in the mempool as a data frame
## The order of the txids is arbitrary and does not match bitcoind

unconfirmed_transactions_txids <- function(){
  url <- "https://mempool.space/api/mempool/txids"
  df <- jsonlite::fromJSON(url)
  data.frame(txid = df)
}

## Returns current count of unconfirmed transactions

unconfirmed_transactions_count <- function(){
  url <- "https://mempool.space/api/mempool"
  df <- jsonlie::fromJSON(url)
  df$count
}

## Returns a list of the last 10 transactions to enter the 
## mempool. Each transaction object contains simplified 
## overview data with the following fields: 
## txid, fee, vsize, and value.

recent_transactions <- function(){
  url <- "https://mempool.space/api/mempool/recent"
  jsonlite::fromJSON(url)
}