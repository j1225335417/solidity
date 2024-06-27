// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console.sol";

contract Bank {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    mapping(address => uint) public deposits;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not Owner");
        _;
    }

    receive() external payable {
        deposits[msg.sender] += msg.value;
        // console.log(string.concat("receive:", msg.value.toString()));
        console.log("receive:", msg.value);
    }

    function getDeposit() public view returns (uint) {
        return deposits[msg.sender];
    }

    function withdraw() public {
        uint deposit = deposits[msg.sender];
        require(deposit > 0, "No balance to withdraw");
        deposits[msg.sender] = 0;
        (bool success, ) = msg.sender.call{value: deposit}(new bytes(0));
        require(success, "ETH transfer failed");
    }

    function withdrawAll() public {
        uint b = address(this).balance;
        (bool success, ) = msg.sender.call{value: b}(new bytes(0));
        require(success, "ETH transfer failed");
    }
}
