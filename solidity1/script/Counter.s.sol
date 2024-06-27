// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../src/Counter.sol";
contract CounterScript is Script {
    // address deployer;
    function setUp() public {
        uint deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);
        // string memory mnemonic = vm.envString("MNEMONIC");
        // (address d, ) = deriveRememberKey(mnemonic, 0);
        // vm.startBroadcast(d);
    }
    function run() public {
        Counter c = new Counter();
        console.log("Counter deployed on %s", address(c));
        vm.stopBroadcast();
    }
}
