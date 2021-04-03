# mempool.spaceR
R Package for [mempool.space](https://mempool.space/) API

## Mempool Functions

<code>recommended_fees()</code> - Returns a dataframe of current recommended fee levels.

<code>projected_blocks()</code> - Returns current mempool as projected blocks.

<code>unconfirmed_transactions_txids()</code> - Returns full list of txids in the mempool.

<code>unconfirmed_transactions_count()</code> - Returns current count of unconfirmed transactions.

<code>recent_transactions()</code> - Returns a list of the last 10 transactions to enter the mempool.

## Block Functions

<code>block_latest_hash()</code> - Returns the hash of the last block.

<code>block_latest_height()</code> - Returns the height of the last block.

<code>block_hash()</code> -Returns the hash of the block currently at height.

<code>block_details()</code> - Returns details about a block.

<code>block_confirmation_status()</code> - Returns the confirmation status of a block.

<code>block_transactions()</code> - Returns a data frame of all txids in the block.

<code>block_tx_index()</code> - Returns the transaction at index within the specified block.

## Transaction Functions

<code>tx_details()</code> - Returns a list with 3 data frames about a transaction.

<code>tx_confirmation_status()</code> - Returns the confirmation status of a transaction. 

<code>tx_hex()</code> - Returns a transaction serialized as hex.

<code>tx_binary()</code> - Returns a transaction as binary data.

<code>tx_merkle_bitcoind()</code> - Returns a merkle inclusion proof for the transaction using bitcoind's format.

<code>tx_merkle_electrum()</code> - Returns a merkle inclusion proof for the transaction using Electrum's format.

<code>tx_outspends()</code> - Returns the spending status of all transaction outputs.

<code>tx_outspends_status()</code> - Returns the spending status of a transaction output.

## Address Functions

<code>address_onchain_stats()</code> - Returns details about an address on chain.

<code>address_mempool_stats()</code>- Returns details about an address in mempool.
