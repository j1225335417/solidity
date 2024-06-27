// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }
    function getNumber1() public view returns (uint256) {
        return number;
    }
    function getNumber2() public pure returns (uint256) {
        return 100;
    }

    function increment() public {
        number++;
    }
}
