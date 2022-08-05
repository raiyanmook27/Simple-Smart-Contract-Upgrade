// SPDX-License-Identifier:MIT

pragma solidity ^0.8.7;

// contract created to store the data from the contracts
contract AdvancedStorage {
    /**
     * use mapping for upgrading state variables
     */
    mapping(string => uint256) _uintStorage;
    mapping(string => address) _addressStorage;
    mapping(string => bool) _boolStorage;
    mapping(string => string) _stringStorage;
    mapping(string => bytes4) _bytesStorage;
    address public owner;
    bool public _initialized;
}
