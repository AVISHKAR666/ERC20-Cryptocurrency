🚀 Project Overview

OurToken (OTK) is a standard-compliant ERC-20 token built using Solidity and deployed with Foundry.
This project demonstrates full ERC-20 functionality, including minting, transfers, allowances, event logging, and fuzz testing — all while following best practices.

Key Highlights:

-Fully ERC-20 compliant (EIP-20 standard)
-Mintable at deployment (initialSupply)
-Secure transfers and approvals
-Event emission for transparency (Transfer & Approval)
-Extensive testing: unit tests and event checks
-Deployable with Foundry scripts
-Gas-efficient and secure by design

___________________________________________________________________________________________________________________________________________________________________________________________________________________________

📦 Features

-Token Details:
Name: OurToken
Symbol: OTK
Decimals: 18
Initial Supply: 1000 OTK (can be customized)

-Core ERC-20 Functions:
transfer() – secure token transfers
approve() & allowance() – manage delegated spending
transferFrom() – spend tokens with prior approval

-Event Logging:
Transfer – emitted on token transfers
Approval – emitted when allowances are set

-Testing & Security:
Unit tests for all core functions
Fuzz testing for random transfer amounts
Zero-address & insufficient balance checks
Approval and transferFrom validation

___________________________________________________________________________________________________________________________________________________________________________________________________________________________

🏗️ Technology Stack

-Solidity (v0.8.18) — smart contract development
-Foundry — testing framework, fuzz testing, and deployment
-OpenZeppelin — audited ERC-20 base contract
-Ethereum — blockchain network for deployment

___________________________________________________________________________________________________________________________________________________________________________________________________________________________


💻 Getting Started

-Clone the repository
git clone  [repo](https://github.com/AVISHKAR666/ERC20-Cryptocurrency)
cd ERC20-Cryptocurrency

-Install Open Zeppelin

-Build the project
make build

-Run tests
make test

-Deploy contract (example)
make deploy

___________________________________________________________________________________________________________________________________________________________________________________________________________________________

🧩 How It Works

-Deployment & Minting:
OurToken is minted to the deployer at contract creation (initialSupply).

-Token Transfers:
Secure token movement between accounts using transfer().

-Allowance Mechanism:
Users can approve another address to spend tokens (approve() & transferFrom()).

-Event Emissions:
Transfer emitted on token transfers
Approval emitted when allowance is set

___________________________________________________________________________________________________________________________________________________________________________________________________________________________

🔒 Security & Best Practices

-Prevents zero-address transfer
-Validates sufficient balances for transfers
-Uses Solidity 0.8.x overflow protection (no SafeMath required)
-Prevents unauthorized spending via allowances
-Extensive tests and fuzzing ensure robustness

___________________________________________________________________________________________________________________________________________________________________________________________________________________________

🌟 Biggest Takeaways

-Implemented a secure, standard ERC-20 token
-Learned deploying with Foundry scripts
-Applied unit tests, event testing, and fuzz tests
-Built developer-ready token contract with OpenZeppelin base

___________________________________________________________________________________________________________________________________________________________________________________________________________________________

📚 Skills Demonstrated

-Solidity smart contract development
-ERC-20 tokenomics understanding
-Secure token transfer & allowance logic
-Foundry testing & scripting
-Contract deployment & verification on Ethereum

___________________________________________________________________________________________________________________________________________________________________________________________________________________________

🔗 Useful Links

[GitHub Repo](https://github.com/AVISHKAR666/ERC20-Cryptocurrency)

___________________________________________________________________________________________________________________________________________________________________________________________________________________________

🙏 Acknowledgements

-Cyfrin Updraft & Patrick Collins — Advanced Foundry course
-OpenZeppelin — for audited ERC-20 standards
-Ethereum community for tooling and ecosystem support

___________________________________________________________________________________________________________________________________________________________________________________________________________________________

