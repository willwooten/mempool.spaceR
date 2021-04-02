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

## Returns a transaction as binary data.

tx_binary <- function(txid, destfile){
  url <- paste0("https://mempool.space/api/tx/", txid, "/raw")
  download.file(url, destfile)
}

## Returns a merkle inclusion proof for the transaction 
## using bitcoind's merkleblock format.

tx_merkle_bitcoind <- function(txid){
  url <- paste0("https://mempool.space/api/tx/", txid, "/merkleblock-proof")
  readLines(url, warn = FALSE)
}


## Returns a merkle inclusion proof for the transaction using 
## Electrum's blockchain.transaction.get_merkle format.
## A list of transaction hashes the current hash is paired with, recursively, 
## in order to trace up to obtain merkle root of the block, deepest pairing first.
## pos = The 0-based index of the position of the transaction 
## in the ordered list of transactions in the block.


tx_merkle_electrum <- function(txid){
  url <- paste0("https://mempool.space/api/tx/", txid, "/merkle-proof")
  df <- jsonlite::fromJSON(url)
  data.frame(
    txid = txid,
    block_height = df$block_height, 
    merkle = df$merkle, 
    pos = df$pos
  )
}