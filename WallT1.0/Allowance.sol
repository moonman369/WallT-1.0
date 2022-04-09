// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/moonman369/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

contract Allowance is Ownable{

    using SafeMath for uint;

    event allowanceChanged(address indexed _member, address indexed changer, uint _oldAmount, uint _newAmount);

    mapping (address => uint) public allowance;

    function setAllowance (address _member, uint _allowance) public onlyOwner{
        emit allowanceChanged(_member, msg.sender, allowance[_member], _allowance);
        allowance[_member] = _allowance;
    }

    modifier ownerOrAllowed (uint _amount) {
        require(msg.sender == owner() || allowance[msg.sender] >= _amount, "You are not allowed!!");
        _;
    }

    function reduceAllowance (address _member, uint _amount) internal {
        emit allowanceChanged(_member, msg.sender, allowance[_member], allowance[_member].sub(_amount));
        allowance[_member] = allowance[_member].sub(_amount);
    }
}
