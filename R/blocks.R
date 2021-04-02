## Returns the hash of the last block.

latest_block_hash <- function(){
  url <- "https://mempool.space/api/blocks/tip/hash"
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