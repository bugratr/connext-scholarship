# Smart Contract for Sending Scholarships to Students
This Github repository contains a Solidity smart contract that sends scholarships to randomly selected Ethereum addresses stored in a text file. The contract uses Connext SDK and XCALL function to transfer tokens across different chains.

## Usage
To use this smart contract, you need to:

Deploy the smart contract on your preferred network (Ethereum mainnet, testnet, or any other supported chain).
Fund the contract with the token that you want to send as scholarships.
Create a list of Ethereum addresses that represent the students eligible for the scholarships and store them in a text file (one address per line).
Call the sendScholarship() function with the amount and metadata of the scholarship to initiate the transfer. The function will randomly select one of the addresses from the text file and transfer the specified amount to that address across different chains using Connext SDK and XCALL function.
## Requirements
To deploy and use this smart contract, you need to have the following:

A compatible Ethereum wallet (such as Metamask) that supports the network where you want to deploy the contract.
Enough balance of the token that you want to send as scholarships to fund the contract.
Basic understanding of Solidity programming language and smart contract development.
Basic knowledge of Connext SDK and XCALL function.
Disclaimer
This smart contract is provided as-is and comes with no guarantees or warranties. Use it at your own risk and always test it thoroughly before deploying it on a live network. The authors of this repository are not responsible for any loss or damage caused by the use of this smart contract.

## Contributions
Contributions to this repository are welcome! If you find any bugs or issues, please report them by opening a Github issue. If you want to contribute code, please fork the repository, make your changes on a new branch, and submit a pull request. We will review and merge your changes as soon as possible.
