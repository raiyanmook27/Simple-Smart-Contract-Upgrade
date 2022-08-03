// SPDX-License-Identifier:MIT

pragma solidity ^0.8.7;

// contract created to store the data from the contracts
contract Storage {
    uint number;

    function getNumber() internal view returns (uint) {
        return number;
    }

    function setNumber(uint _number) internal {
        number = _number;
    }
}
