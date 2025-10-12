// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {OurToken} from "../src/OurToken.sol";
import {DeployOurToken} from "../script/DeployOurToken.s.sol";

contract TestOurToken is Test {
    OurToken public ourToken;
    DeployOurToken public deployOurToken;

    address alice = makeAddr("alice");
    address bob = makeAddr("bob");
    address deployer;

    uint256 public constant STARTING_BALANCE = 100 ether;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    function setUp() public {
        ourToken = new OurToken(1000 ether); // msg.sender = this test contract
        deployer = address(this);

        // Give bob some tokens
        ourToken.transfer(bob, STARTING_BALANCE);
    }

    /*//////////////////////////////////////////////////////////////
                            DEPLOYMENT TESTS
    //////////////////////////////////////////////////////////////*/

    function testDeploymentDetails() public view {
        assertEq(ourToken.name(), "OurToken");
        assertEq(ourToken.symbol(), "OTK");
        assertEq(ourToken.decimals(), 18);
    }

    // function testTotalSupplyAssignedToDeployer() public view {
    //     uint256 expected = deployOurToken.INITIAL_SUPPLY() - STARTING_BALANCE;
    //     assertEq(ourToken.totalSupply(), deployOurToken.INITIAL_SUPPLY());
    //     assertEq(ourToken.balanceOf(deployer), expected);
    // }

    /*//////////////////////////////////////////////////////////////
                            TRANSFER TESTS
    //////////////////////////////////////////////////////////////*/

    function testTransferUpdatesBalances() public {
        vm.prank(bob);
        ourToken.transfer(alice, 10 ether);

        assertEq(ourToken.balanceOf(alice), 10 ether);
        assertEq(ourToken.balanceOf(bob), STARTING_BALANCE - 10 ether);
    }

    function testTransferFailsIfNotEnoughBalance() public {
        vm.prank(alice); // Alice has 0
        vm.expectRevert();
        ourToken.transfer(bob, 1 ether);
    }

    function testTransferToZeroAddressReverts() public {
        vm.prank(bob);
        vm.expectRevert();
        ourToken.transfer(address(0), 10 ether);
    }

    function testZeroTransferDoesNotChangeBalance() public {
        vm.prank(bob);
        ourToken.transfer(alice, 0);
        assertEq(ourToken.balanceOf(bob), STARTING_BALANCE);
    }

    /*//////////////////////////////////////////////////////////////
                            ALLOWANCE TESTS
    //////////////////////////////////////////////////////////////*/

    function testApproveAndAllowance() public {
        vm.prank(bob);
        ourToken.approve(alice, 50 ether);
        assertEq(ourToken.allowance(bob, alice), 50 ether);
    }

    function testTransferFromWorks() public {
        vm.prank(bob);
        ourToken.approve(alice, 50 ether);

        vm.prank(alice);
        ourToken.transferFrom(bob, alice, 20 ether);

        assertEq(ourToken.balanceOf(alice), 20 ether);
        assertEq(ourToken.balanceOf(bob), STARTING_BALANCE - 20 ether);
        assertEq(ourToken.allowance(bob, alice), 30 ether);
    }

    function testTransferFromFailsWithoutApproval() public {
        vm.prank(alice);
        vm.expectRevert();
        ourToken.transferFrom(bob, alice, 1 ether);
    }

    /*//////////////////////////////////////////////////////////////
                            EVENT TESTS
    //////////////////////////////////////////////////////////////*/

    function testTransferEventEmitted() public {
        vm.prank(bob);
        vm.expectEmit(true, true, false, true);
        emit Transfer(bob, alice, 5 ether);
        ourToken.transfer(alice, 5 ether);
    }

    function testApprovalEventEmitted() public {
        vm.prank(bob);
        vm.expectEmit(true, true, false, true);
        emit Approval(bob, alice, 10 ether);
        ourToken.approve(alice, 10 ether);
    }

    /*//////////////////////////////////////////////////////////////
                            FUZZ TESTS
    //////////////////////////////////////////////////////////////*/

    function testFuzz_Transfer(uint256 amount) public {
        vm.assume(amount <= STARTING_BALANCE);
        vm.prank(bob);
        ourToken.transfer(alice, amount);
        assertEq(ourToken.balanceOf(alice), amount);
    }
}
