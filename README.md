# ERC-918
ERC 918 token solidty version ^0.5.0; 



ERC 918:

used 918 token with private block chain using geth. 
run geth commands to connect on cmd

To make Private Ethereum blockchain: (note : in repository i had already made it)
but if you want to make it you can Remember "--datdir=./blckchain " blckchain is name of directory of private block chain you can change this name

geth --port 3000 --networkid 58343 --nodiscover --datadir=./blkchain --maxpeers=0  --rpc --rpcport 8543 --rpcaddr 127.0.0.1 --rpccorsdomain "*" --rpcapi "eth,net,web3,personal,miner" --"allow-insecure-unlock" 

To connect with gethconsole: open cmd again

geth attach http://127.0.0.1:8543

After connection"


making new account:

 personal.newAccount('seed')    (Note= seed is passowrd you can change it)

Unlock account:

 personal.unlockAccount(web3.eth.coinbase, "seed", 15000)

Check accounts:

eth.accounts




to get dummy Ether:

web3.fromWei(eth.getBalance(eth.coinbase), "ether")



To check Balance:
 eth.getBalance(eth.coinbase)


