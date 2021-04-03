# mempool.spaceR
R Package for mempool.space API

## Mempool Functions

'recommended_fees()' - Returns a dataframe of current recommended fee levels.
'projected_blocks()' - Returns current mempool as projected blocks.
'unconfirmed_transactions_txids()' - Returns full list of txids in the mempool.
'unconfirmed_transactions_count()' - Returns current count of unconfirmed transactions.
'recent_transactions()' - Returns a list of the last 10 transactions to enter the mempool.

## Block Functions

'block_latest_hash()' - Returns the hash of the last block.
'block_latest_height()' - Returns the height of the last block.
'block_hash()' -Returns the hash of the block currently at height.
'block_details()' - Returns details about a block.
'block_confirmation_status()' - Returns the confirmation status of a block.
'block_transactions()' - Returns a data frame of all txids in the block.
'block_tx_index()' - Returns the transaction at index within the specified block.

## Transaction Functions

'tx_details()' - Returns a list with 3 data frames about a transaction.
'tx_confirmation_status()' - Returns the confirmation status of a transaction. 
'tx_hex()' - Returns a transaction serialized as hex.
'tx_binary()' - Returns a transaction as binary data.
'tx_merkle_bitcoind()' - Returns a merkle inclusion proof for the transaction using bitcoind's format.
'tx_merkle_electrum()' - Returns a merkle inclusion proof for the transaction using Electrum's format.
'tx_outspends()' - Returns the spending status of all transaction outputs.
'tx_outspends_status()' - Returns the spending status of a transaction output.

## Address Functions
'address_onchain_stats()' - Returns details about an address on chain.
'address_mempool_stats() '- Returns details about an address in mempool
