// SPDX-License-Identifier:MIT

pragma solidity ^0.8.7;

import "./Storage.sol";

contract ProxyContract is Storage {
    // uint number and the other methods(from the storage.sol)a is also inherited

    //current address of the contract
    address public currentFunctionalContract;

    //gets the current address of the contract
    constructor(address _functionalAddress) {
        currentFunctionalContract = _functionalAddress;
    }

    // this upgrades the address of current contract to another contract
    // when upgraade is needed.
    function upgradeContract(address _funAddress) public {
        currentFunctionalContract = _funAddress;
    }

    function getNumber1() public returns (bytes memory) {
        //using delegatecall - it preserves the state of the proxy call
        // but uses the functionality of the current contract.
        (, bytes memory number) = currentFunctionalContract.delegatecall(
            abi.encodeWithSignature("getNumber1()")
        );
        return number;
    }

    function setNumber1(uint _number) public {
        (bool sent, ) = currentFunctionalContract.delegatecall(
            abi.encodeWithSignature("setNumber1(uint256)", _number)
        );

        if (!sent) revert();
    }
}
