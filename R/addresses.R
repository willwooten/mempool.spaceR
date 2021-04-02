## Returns details about an address on chain

address_onchain_stats <- function(address){
  url <- paste0("https://mempool.space/api/address/", address)
  df <- jsonlite::fromJSON(url)
  data.frame(
    funded_txo_count = df$chain_stats$funded_txo_count, 
    funded_txo_sum = df$chain_stats$funded_txo_sum, 
    spent_txo_count = df$chain_stats$spent_txo_count, 
    spent_txo_sum = df$chain_stats$spent_txo_sum, 
    tx_count = df$chain_stats$tx_count
  )
}

## Returns details about an address in mempool

address_mempool_stats <- function(address){
  url <- paste0("https://mempool.space/api/address/", address)
  df <- jsonlite::fromJSON(url)
  data.frame(
    funded_txo_count = df$mempool_stats$funded_txo_count, 
    funded_txo_sum = df$mempool_stats$funded_txo_sum, 
    spent_txo_count = df$mempool_stats$spent_txo_count, 
    spent_txo_sum = df$mempool_stats$spent_txo_sum, 
    tx_count = df$mempool_stats$tx_count
  )
}


