## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
- **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
- **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
- **Chisel**: Fast, utilitarian, and verbose solidity REPL.

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

## Custom Errors

- we can use custom errors in solidity by using the `error` keyword

## Solidity Events

- Events allow you to print info into logging structure which is more gas efficient than actually storing it to storage variable

- it is declared by `event` keyword.
- makes migration easier
- Makes front end "indexing" easier
- Events and logs live in a special datastruture that isn't accessable to smart contrats and that's why it's cheaper

### Index Parameters

- `indexed` keyword is used to define indexed parameters.
- There can be upto 3 indexed parameters delcared in an event
- They are much easier to search for than the non indexed ones
- The non-indexed ones are harder to search cuz they get ABI encoded
