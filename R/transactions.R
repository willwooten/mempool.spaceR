## Returns a list with 4 data frames about a transaction. 
## Available fields: txid, version, locktime, 
## size, weight, fee, vin, vout, and status.

tx_details <- function(txid){
  df_list <- list()
  url <- paste0("https://mempool.space/api/tx/", txid)
  df <- jsonlite::fromJSON(url)
  
  df_list[["details"]] <- data.frame(
    txid = df$txid, 
    version = df$version, 
    locktime = df$locktime, 
    size = df$size, 
    weight = df$weight,
    fee = df$fee
  )
  if(df$status$confirmed == TRUE){
    df_list[["status"]] <- data.frame(
      confirmed = df$status$confirmed, 
      block_height = df$status$block_height, 
      block_hash = df$status$block_hash, 
      block_time = df$status$block_time 
    )} else {
      df_list[["status"]] <- data.frame(
        confirmed = df$status$confirmed)
    }
  
  df_list[["vin"]] <- df$vin
  df_list[["vout"]] <- df$vout
  df_list
}


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
  readr::readLines(url, warn = FALSE)
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
  readr::readLines(url, warn = FALSE)
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

## Returns the spending status of all transaction outputs.

tx_outspends <- function(txid){
  url <- paste0("https://mempool.space/api/tx/", txid , "/outspends")
  jsonlite::fromJSON(url)
}

## Returns the spending status of a transaction output. 
## Available fields: spent (boolean), txid (optional), 
## vin (optional), and status (optional, the status of the spending tx).

tx_outspends_status <- function(txid, vout_index = 0){
  url <- paste0("https://mempool.space/api/tx/", txid ,"/outspend/", vout_index)
  df <- jsonlite::fromJSON(url)
  data.frame(
    spent = df$spent, 
    txid = df$txid, 
    vin = df$vin, 
    confirmed = df$status$confirmed, 
    block_height = df$status$block_height, 
    block_hash = df$status$block_hash, 
    block_time = df$status$block_time
  )
}