## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```

# forge script  script/Counter.s.sol --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
# cast send 0x4826533B4897376654Bb4d4AD88B7faFD0C98528 "increment()" --rpc-url http://127.0.0.1:8545  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
# cast send 0x4826533B4897376654Bb4d4AD88B7faFD0C98528 "increment2()" --rpc-url $ETH_RPC_URL  --private-key $PRIVATE_KEY
# cast call 0x4826533B4897376654Bb4d4AD88B7faFD0C98528 "getNumber1()" --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
# cast call 0x4826533B4897376654Bb4d4AD88B7faFD0C98528 "getNumber2()(uint256)" --rpc-url http://127.0.0.1:8545 

# forge script script/Bank.s.sol --rpc-url local --broadcast
# cast send 0x3Aa5ebB10DC797CAC828524e59A333d0A371443c --value 1 ether --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

#  cast call 0x959922bE3CAee4b8Cd9a407cc3ac1C251C2007B1 "withdraw()" --rpc-url http://127.0.0.1:8545  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
#   cast balance 0x3Aa5ebB10DC797CAC828524e59A333d0A371443c

# cast call 0x3Aa5ebB10DC797CAC828524e59A333d0A371443c "deposits(address)" 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 --rpc-url http://127.0.0.1:8545



# -------

# cast config --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
# forge script  script/Bank.s.sol  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
# forge script  script/Bank.s.sol --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
# cast send 0x4ed7c70F96B99c776995fB64377f0d4aB3B0e1C1  --value 1 ether --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
# cast call 0x4ed7c70F96B99c776995fB64377f0d4aB3B0e1C1 "withdraw()" --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
# cast call 0x4ed7c70F96B99c776995fB64377f0d4aB3B0e1C1 "fallback()" --value 1 ether --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
# cast call 0x4ed7c70F96B99c776995fB64377f0d4aB3B0e1C1 "withdrawAll()" --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
# cast call 0x322813Fd9A801c5507c9de605d63CEA4f2CE6c44 "getDeposit()" --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80


# forge script  script/Bank.s.sol --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
# cast send --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80  0x84eA74d481Ee0A5332c457a4d796187F6Ba67fEB --value 1ether  // 成功向合约转ETH
# cast call --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --rpc-url http://127.0.0.1:8545   0x9E545E3C0baAB3E08CdfD552C960A1050f373042 "test()(uint)"  
# cast call --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --rpc-url http://127.0.0.1:8545   0x84eA74d481Ee0A5332c457a4d796187F6Ba67fEB "getDepositByAddress()" 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266  


# cast call 0x9E545E3C0baAB3E08CdfD552C960A1050f373042 "balance()(uint256)" --rpc-url http://127.0.0.1:8545  --legacy