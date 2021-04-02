## Returns current mempool as projected blocks
## with projected blocksize (Mb), virtual blocksize, 
## number of transactions, total fees, median fee, 
## minimum fee, and maximum fee

projected_blocks <- function(){
  url <- "https://mempool.space/api/v1/fees/mempool-blocks"
  block_list <- list()
  df <- jsonlite::fromJSON(url)
  
  for (i in 1:nrow(df)){
    block_list[[i]] <- data.frame(
      block_mb_size = df$blockSize[i], 
      block_virtual_size = df$blockVSize[i], 
      block_transactions = df$nTx[i],
      block_total_fees = df$totalFees[i], 
      block_median_fee = df$medianFee[i], 
      block_min_fee = min(df$feeRange[[i]]), 
      block_max_fee = max(df$feeRange[[i]]))
  }
  
  blocks <- data.table::rbindlist(block_list)
  
  blocks
}


