// SPDX-License-Identifier:MIT

pragma solidity ^0.8.7;

import "./Storage.sol";

//inherits the properties of Storage
contract Functional1 is Storage {
    // uint number and the other methods(from the storage.sol)a is also inherited

    function getNumber1() public view returns (uint) {
        return Storage.getNumber();
    }

    function setNumber1(uint _number) public {
        Storage.setNumber(_number);
    }
}
