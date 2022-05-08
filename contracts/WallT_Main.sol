// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import "./Allowance.sol";
import {Allowance as Allowance} from "./Allowance.sol";

contract Wallt1 is Allowance{

    event fundsDeposited(address indexed _depositor, uint _amount);

    event fundsWithdrawn(address indexed _beneficiary, uint _amount);

    function getWalletBalance() public view returns (uint) {
        return address(this).balance;
    }

    fallback() external payable {
        emit fundsDeposited(msg.sender, msg.value);
    }

    function withdrawFunds(address payable _to, uint _amount) public ownerOrAllowed(_amount){
        require (_amount <= address(this).balance, "Insufficient WallT balance.");
        if (msg.sender != owner()){
            reduceAllowance(msg.sender, _amount);
        }
        emit fundsWithdrawn(_to, _amount);
        _to.transfer(_amount);
    }

    function renounceOwnership () public override{
        revert ("Can't renounce ownership.");
    }

}