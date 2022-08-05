// SPDX-License-Identifier:MIT

pragma solidity ^0.8.7;

import "./Advanced_Storage.sol";

contract Advanced_ProxyContract is Advanced_Storage {
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

    // fallback function redirects all calls when a funtion
    //does not exist in this contract
    fallback() external payable {
        address impl = currentFunctionalContract;
        require(currentFunctionalContract != address(0));
        bytes memory data = msg.data;

        assembly {
            let result := delegatecall(
                gas,
                impl,
                add(data, 0x20),
                mload(data),
                0,
                0
            )
            let size := returndatasize
            let ptr := mload(0x40)

            returndatacopy(ptr, 0, size)
            switch result
            case 0 {
                revert(ptr, size)
            }
            default {
                return(ptr, size)
            }
        }
    }
}
