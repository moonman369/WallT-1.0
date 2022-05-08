//contract/token.sol
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

/**
 * @title TokenXYZ
 */
contract TestToken is  ERC20 {

    /**
     * @dev Creates a ERC20 token contract with the passed specifications
     */
    constructor (uint256 _totalSupply) 
    ERC20 ("Test Token", "TEST") {
        _mint(_msgSender(), _totalSupply);
    }
    
}