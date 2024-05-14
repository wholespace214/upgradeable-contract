// SPDX-License-Identifier: MIT
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

pragma solidity ^0.8.19;

contract contractA is Initializable, OwnableUpgradeable, UUPSUpgradeable {
    uint public amount;

    constructor() {
        _disableInitializers();
    }

    function initialize() public initializer {
        __Ownable_init(msg.sender); //sets owner to msg.sender
        __UUPSUpgradeable_init();
    }

    function initialAmount(uint _amount) public returns (uint) {
        amount = _amount;
        return amount;
    }

    function inc(uint _amount) public returns (uint) {
        amount = _amount + 10;
        return amount;
    }

    function _authorizeUpgrade(
        address newImplementation
    ) internal override onlyOwner {}
}
