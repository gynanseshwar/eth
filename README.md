# SuperToken Smart Contract

This repository contains a simple Ethereum smart contract called "SuperToken" written in Solidity. The SuperToken contract allows users to create and manage a custom token with basic functionalities such as minting and burning tokens. This README provides an overview of the contract, its functions, and how to use it.

## Table of Contents

- [Introduction](#introduction)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Deploying the Contract](#deploying-the-contract)
- [Contract Details](#contract-details)
  - [Constructor](#constructor)
  - [Mint](#mint)
  - [Burn](#burn)
- [Usage](#usage)
- [Author](#Author)
- [License](#license)

## Introduction

The SuperToken smart contract is designed to be a basic example of a custom token contract. It allows users to create a custom token with a specified name and an initial supply. Users can mint additional tokens and burn existing tokens as needed. The contract is written in Solidity and can be deployed on the Ethereum blockchain.

## Getting Started

### Prerequisites

To deploy and interact with the SuperToken contract, you'll need the following:

- An Ethereum development environment (e.g., Remix, Truffle, Hardhat)
- An Ethereum wallet (e.g., MetaMask) connected to the network where you plan to deploy the contract
- Sufficient Ether for gas fees

### Deploying the Contract

1. Compile the Solidity code using your preferred development environment.
2. Deploy the contract to the Ethereum network of your choice. You will need to provide values for the `_name` and `_initialTokens` parameters when deploying the contract.

## Contract Details

The SuperToken contract has the following important functions and state variables:

### Constructor

The constructor is called when the contract is deployed and accepts two parameters: `_name` and `_initialTokens`. It initializes the token's name and the total token supply.

- `string public tokenName`: A publicly readable variable that holds the name of the token.
- `uint256 public totalTokens`: A publicly readable variable that holds the total supply of tokens.
- `mapping(address => uint256) public tokenHoldings`: A mapping that associates Ethereum addresses with the number of tokens they hold.

### Mint

The `Mint` function allows users to create new tokens and assign them to a specific address. It accepts two parameters: `_receiver` and `_amount`. Users can only mint a positive amount of tokens, and the total supply is increased accordingly.

```solidity
function Mint(address _receiver, uint256 _amount) public {
  require(_amount > 0, "Amount must be greater than zero");
  totalTokens += _amount;
  tokenHoldings[_receiver] += _amount;
}
```

### Burn

The `Burn` function allows users to destroy tokens from their own balance. It accepts one parameter: `_amount`. Users can only burn a positive amount of tokens, and the total supply is reduced accordingly.

```solidity
function Burn(uint256 _amount) public {
  require(_amount > 0, "Amount must be greater than zero");
  require(tokenHoldings[msg.sender] >= _amount, "Insufficient token holdings");
  totalTokens -= _amount;
  tokenHoldings[msg.sender] -= _amount;
}
```

## Usage

To use the SuperToken contract, follow these steps:

1. Deploy the contract to the Ethereum network with a name and an initial supply.
2. Interact with the contract using an Ethereum wallet or a Dapp. Use the `Mint` function to create new tokens and the `Burn` function to burn tokens from your own balance.

## Author

Gyneshwar

din08oss55@gmail.com

## License

This code is provided under the MIT License. You are free to use, modify, and distribute it as per the terms of the license.
