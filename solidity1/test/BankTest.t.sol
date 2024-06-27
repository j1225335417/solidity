// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Bank.sol";

contract BankTest is Test {
    Bank public bank;
    address public user = address(1);
    address public owner = address(this);

    function setUp() public {
        bank = new Bank();
    }

    function testDeposit() public {
        vm.deal(user, 1 ether);
        vm.prank(user);
        (bool success, ) = address(bank).call{value: 1 ether}("");
        assertTrue(success);
        assertEq(bank.deposits(user), 1 ether);
    }

    function testWithdraw() public {
        vm.deal(user, 1 ether);
        vm.prank(user);
        (bool success, ) = address(bank).call{value: 1 ether}("");
        assertTrue(success);
        assertEq(bank.deposits(user), 1 ether);

        vm.prank(user);
        bank.withdraw();
        assertEq(bank.deposits(user), 0);
        assertEq(user.balance, 1 ether);
    }

    function testWithdrawAll() public {
        vm.deal(user, 1 ether);
        vm.prank(user);
        (bool success, ) = address(bank).call{value: 1 ether}("");
        assertTrue(success);
        assertEq(bank.deposits(user), 1 ether);
        vm.prank(user);
        bank.withdraw();
        assertEq(bank.deposits(user), 0);
        vm.deal(owner, 0.5 ether);
        vm.prank(owner);
        (bool successOwner, ) = address(bank).call{value: 0.5 ether}("");
        assertTrue(successOwner);
        uint contractBalance = address(bank).balance;
        assertEq(contractBalance, 0.5 ether);
        bank.withdrawAll();
        assertEq(address(bank).balance, 0);
        assertEq(owner.balance, 0.5 ether);
    }
    fallback() external payable {
        // 处理接收到的以太币
        console.log("withdraw", msg.value);
    }
}
