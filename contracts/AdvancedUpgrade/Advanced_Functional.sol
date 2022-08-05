// SPDX-License-Identifier:MIT

pragma solidity ^0.8.7;

import "./Advanced_Storage.sol";

//inherits the properties of Storage
contract Advanced_Functional1 is Advanced_Storage {
    // uint number and the other methods(from the storage.sol)a is also inherited

    modifier onlyOwner() {
        require(msg.sender == owner);
    }

    constructor() {
        owner = msg.sender;
    }

    function getNumber1() public view returns (uint) {
        return _uintStorage["Number"];
    }

    function setNumber1(uint _number) public {
        _uintStorage["Number"] = _number;
    }
}
