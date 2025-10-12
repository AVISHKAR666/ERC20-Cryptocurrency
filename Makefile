# Makefile for Foundry project

.PHONY: anvil build test deploy clean

anvil:
	anvil

build:
	forge build

test:
	forge test -vvv

deploy:
	forge script script/DeployOurToken.s.sol:DeployOurToken

clean:
	forge clean
