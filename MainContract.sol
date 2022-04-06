pragma solidity >0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract Wallt1 is Ownable{

    mapping (address => uint) public allowance;

    function getWalletBalance() public view returns (uint) {
        return address(this).balance;
    }

    fallback() external payable {}

    function setAllowance (address _member, uint _allowance) public onlyOwner{
        allowance[_member] = _allowance;
    }

    modifier ownerOrAllowed (uint _amount) {
        require(msg.sender == owner() || allowance[msg.sender] >= _amount, "You are not allowed!!");
        _;
    }

    function withdrawFunds(address payable _to, uint _amount) public ownerOrAllowed(_amount){
        _to.transfer(_amount);
    }

}