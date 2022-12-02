//A shared wallet where:
//anyone can deposit funds
//only owner can withdraw unlimited amount
//only owner can set allowance amount to addresses
//other addresses can only withdraw upto their allowance amount

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract SharedWallet{

    address owner;

    //mapping to map address to corresponding allowance
    mapping(address => uint) public allowance;

    //fallback function to deposit funds to SC
    fallback() external payable{}

    //set the owner using constructor
    constructor(){
        owner = msg.sender;
    }

    // only owner
    modifier onlyOwner(){

        require(msg.sender == owner, "You are not allowed to do this function");
        _;
    }

    //withdrawal function
    function ownerWithdraw(address payable _to, uint _amount)public onlyOwner {
        
        //withdraw funds from this contract
        _to.transfer(_amount);

    }

    //function to set allowance to addresses
    function setAllowance(address _to, uint  _amount)public onlyOwner{
        allowance[_to] = _amount;
    }


    //withdraw by allowance allowed
    function withdrawAllowance(address payable _to,uint _amount)public{

        require(allowance[_to] >= _amount, "Not enough balance");

        allowance[_to] -= _amount;

        _to.transfer(_amount);
    }

}
