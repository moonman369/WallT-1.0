// SPDX-License-Identifier: MIT
// Uses OpenZeppelin Contracts v4.4.1 (access/Ownable.sol)
pragma solidity ^0.8.7;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Context.sol";

contract WallT_Handle_Tokens is Context{

    IERC20[] tokens;

    mapping (IERC20 => uint256) public tokenBalance;

    function addToken (address _token) external {
        IERC20 token = IERC20(_token);
        tokens.push(token);
        tokenBalance[token] = token.balanceOf(_msgSender());
    }
}