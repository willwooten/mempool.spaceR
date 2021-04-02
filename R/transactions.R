## Returns the confirmation status of a transaction. 
## Available fields: confirmed (boolean), block_height (optional)
## and block_hash (optional).

tx_confirmation_status <- function(txid){
  url <- paste0("https://mempool.space/api/tx/", txid, "/status")
  df <- jsonlite::fromJSON(url)
  data.frame(
    confirmed = df$confirmed, 
    block_height = df$block_height, 
    block_hash = df$block_hash,
    block_time = df$block_time
  )
}

## Returns a transaction serialized as hex.

tx_hex <- function(txid){
  url <- paste0("https://mempool.space/api/tx/", txid, "/hex")
  readLines(url, warn = FALSE)
  
}