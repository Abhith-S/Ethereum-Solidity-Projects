//A shared wallet where:
//anyone can deposit funds
//only owner can withdraw unlimited amount
//only owner can set allowance amount to addresses
//other addresses can only withdraw upto their allowance amount

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

//importing contract that sets msg.sender as owner and gives other functionalities
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract SharedWallet is Ownable{

    //mapping to map address to corresponding allowance
    mapping(address => uint) public allowance;

    //fallback function to deposit funds to SC
    fallback() external payable{}

    //the fallback fn needs a recieve ether function to get rid of the warnings
    receive() external payable{}


    // only owner or allowed address
    modifier ownerOrAllowed(uint _amount) {
        
        //here the owner() is from Ownable.sol
        require(msg.sender == owner() ||allowance[msg.sender] >= _amount, "You are not allowed");
        _;
    }

    //function to set allowance to addresses
    //the onlyOwner modifier here comes from openzepplin ownable.sol
    function setAllowance(address _to, uint  _amount)public onlyOwner{
        allowance[_to] = _amount;
    }


    //withdraw by allowance allowed or any amount by owner
    //can pass the _amount from withdraw() to ownerOrAllowed()
    function withdraw(address payable _to,uint _amount)public ownerOrAllowed(_amount){

        //allowance[_to] -= _amount;

        _to.transfer(_amount);
    }

}
