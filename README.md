# AVEX-MOD2
# ShubhamWallet Smart Contract
This repository contains the source code for the ShubhamWallet smart contract written in Solidity.

# Overview
ShubhamWallet is a simple Ethereum smart contract that provides basic functionalities for managing a wallet. It allows the owner to deposit and withdraw tokens, check the current balance, and buy non-fungible tokens (NFTs). The contract is written in Solidity version 0.8.9.

# Features
DepositToken: Allows the owner to deposit tokens into the wallet.

WithdrawToken: Allows the owner to withdraw tokens from the wallet, subject to available balance. It includes a check for low balance, throwing a LowBalance error if the withdrawal amount exceeds the current balance.

getBalance: Retrieves the current balance of the wallet.

getContractAddress: Retrieves the address of the contract.

getContractBalance: Retrieves the Ether balance of the contract.

BuyNFT: Initiates the process of buying a non-fungible token (NFT). It internally calls the WithdrawToken function.

# Below are the instructions on how to run this project on your computer.
After cloning the github, you will want to do the following to get the code running on your computer.

Inside the project directory, in the terminal type: npm i

Open two additional terminals in your VS code

In the second terminal type: npx hardhat node

In the third terminal, type: npx hardhat run --network localhost scripts/deploy.js

Back in the first terminal, type npm run dev to launch the front-end.

After this, the project will be running on your localhost. Typically at http://localhost:3000/
