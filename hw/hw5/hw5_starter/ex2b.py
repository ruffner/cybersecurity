from sys import exit
from bitcoin.core.script import *

from utils import *
from config import my_private_key, my_public_key, my_address, faucet_address
from ex1 import P2PKH_scriptPubKey
from ex2a import ex2a_txout_scriptPubKey


######################################################################
# TODO: set these parameters correctly
amount_to_send = 0.003
txid_to_spend = '5e02fff3f09250a4ab64a73517013c22d996045d604a8fbffd26a2948080e296'
utxo_index = 10
######################################################################

txin_scriptPubKey = ex2a_txout_scriptPubKey
######################################################################
# TODO: implement the scriptSig for redeeming the transaction created
# in  Exercise 2a.
#txin_scriptSig = [ 2534, -1444]
#txin_scriptSig = [ 2534, 1444 ]
#txin_scriptSig = [ b'\x09\xE6', b'\x05\xA4']
txin_scriptSig = [1444, 2534]
######################################################################
txout_scriptPubKey = P2PKH_scriptPubKey(faucet_address)

response = send_from_custom_transaction(
    amount_to_send, txid_to_spend, utxo_index,
    txin_scriptPubKey, txin_scriptSig, txout_scriptPubKey)
print(response.status_code, response.reason)
print(response.text)
