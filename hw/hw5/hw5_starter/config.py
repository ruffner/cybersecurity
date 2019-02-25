from bitcoin import SelectParams
from bitcoin.base58 import decode
from bitcoin.wallet import CBitcoinAddress, CBitcoinSecret, P2PKHBitcoinAddress


SelectParams('testnet')

# TODO: Fill this in with your private key.
my_private_key = CBitcoinSecret(
    'cUdBKLJgW4i5WttjEdARoPicNepc21ixx2UNgyd7tFBdzGtqaerb')
my_public_key = my_private_key.pub
my_address = P2PKHBitcoinAddress.from_pubkey(my_public_key)

faucet_address = CBitcoinAddress('n3qmL3GcTF9rvbf6kqpuzLYQZCjrTSqaGk')

# send back address: mv4rnyY3Su5gjcDNzbMLKBQkBicCtHUtFB
# transaction hash:   65e262e41987ed7652847afeb56ff975060abe9a89cf53330c6664a045dbedd9