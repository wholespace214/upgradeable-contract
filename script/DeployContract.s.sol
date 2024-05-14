// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {contractA} from "../src/contractA.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract DeployContractA is Script {
    function run() external returns (address) {
        address proxy = deployContractA();
        return proxy;
    }

    function deployContractA() public returns (address) {
        vm.startBroadcast();
        contractA ContractA = new contractA(); //Our implementation(logic).Proxy will point here to delegate call/borrow the functions
        ERC1967Proxy proxy = new ERC1967Proxy(address(ContractA), "");
        vm.stopBroadcast();
        return address(proxy);
    }
}
