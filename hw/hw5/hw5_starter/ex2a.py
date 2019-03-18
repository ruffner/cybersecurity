from sys import exit
from bitcoin.core.script import *

from utils import *
from config import my_private_key, my_public_key, my_address, faucet_address
from ex1 import send_from_P2PKH_transaction


######################################################################
# TODO: Complete the scriptPubKey implementation for Exercise 2
#ex2a_txout_scriptPubKey = [ OP_EQUAL, OP_EQUALVERIFY ] 
ex2a_txout_scriptPubKey = [ OP_2DUP, OP_ADD, 3978, OP_EQUALVERIFY, OP_SUB, 1090, OP_EQUALVERIFY ] 
#ex2a_txout_scriptPubKey = [ OP_2DUP, OP_ADD, 3978, OP_EQUALVERIFY, OP_SUB, 1090, OP_EQUALVERIFY ] 
# [OP_DUP, OP_HASH160, faucet_address, OP_EQUALVERIFY, OP_CHECKSIG]
#[OP_ADD 2534 -1444]
######################################################################

if __name__ == '__main__':
    ######################################################################
    # TODO: set these parameters correctly
    amount_to_send = .0003
    txid_to_spend = (
        '5e02fff3f09250a4ab64a73517013c22d996045d604a8fbffd26a2948080e296')
    utxo_index = 10
    ######################################################################

    response = send_from_P2PKH_transaction(
        amount_to_send, txid_to_spend, utxo_index,
        ex2a_txout_scriptPubKey)
    print(response.status_code, response.reason)
    print(response.text)
