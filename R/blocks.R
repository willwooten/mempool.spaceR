## Returns the hash of the last block.

block_latest_hash <- function(){
  url <- "https://mempool.space/api/blocks/tip/hash"
  read_lines(url)
}

## Returns the height of the last block.

block_latest_height <- function(){
  url <- "https://mempool.space/api/blocks/tip/height"
  read_lines(url)
}

## Returns the hash of the block currently at height

block_hash <- function(height){
  url <- paste0("https://mempool.space/api/block-height/", height)
  read_lines(url)
}

## Returns details about a block. Available fields: 
## id, height, version, timestamp, bits, nonce, merkle_root, 
## tx_count, size, weight, and previousblockhash.

block_details <- function(hash){
  url <- paste0("https://mempool.space/api/block/", hash)
  block <- jsonlite::fromJSON(url)
  
  data.frame(
    block_id = block$id, 
    height = block$height, 
    version = block$version, 
    timestamp = block$timestamp, 
    tx_count = block$tx_count, 
    size = block$size, 
    weight = block$weight, 
    merkle_root = block$merkle_root, 
    previous_block_hash = block$previousblockhash, 
    median_time = block$mediantime, 
    nonce = block$nonce, 
    bits = block$bits, 
    difficulty = block$difficulty
  )
}


## Returns the confirmation status of a block. Available fields: 
## in_best_chain (boolean, false for orphaned blocks), next_best 
## (the hash of the next block, only available for blocks in the best chain).

block_confirmation_status <- function(hash){
  url <- paste0("https://mempool.space/api/block/", hash, "/status")
  block <- jsonlite::fromJSON(url)
  data.frame(
    in_best_chain = block$in_best_chain, 
    height = block$height, 
    next_best = ifelse(is.null(block$next_best), "NULL", block$next_best)
  )
}

## Returns a data frame of all txids in the block.

block_transactions <- function(hash){
  url <- paste0("https://mempool.space/api/block/", hash, "/txids")
  df <- jsonlite::fromJSON(url)
  data.frame(txid = df)
}

## Returns the transaction at index within the specified block.

block_tx_index <- function(hash, index){
  url <- paste0("https://mempool.space/api/block/", hash, "/txid/", index)
  read_lines(url)
}


