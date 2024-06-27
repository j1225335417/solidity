// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../src/Bank.sol";
contract BankScript is Script {
    // address deployer;
    function setUp() public {
        uint deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);
        // string memory mnemonic = vm.envString("MNEMONIC");
        // (address d, ) = deriveRememberKey(mnemonic, 0);
        // vm.startBroadcast(d);
    }
    function run() public {
        Bank c = new Bank();
        console.log("Bank deployed on %s", address(c));
        vm.stopBroadcast();
    }
}
