// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "./BaseScript.s.sol";
import "../src/Bank.sol";
contract BankScript is BaseScript {
    function run() public broadcaster {
        Bank c = new Bank();
        console.log("Bank deployed on %s", address(c));
        saveContract("local", "Bank", address(c));
    }
}
