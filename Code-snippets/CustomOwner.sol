//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Smart contract in which only an owner can set a new owner
contract CustomOwner{
    
    address public owner;

    //constructor sets msg.sender as owner
    constructor(){
        owner = msg.sender;
    }

    //function modifier that ensures msg.sender is the owner
    modifier onlyOwner(){
        require(msg.sender == owner, "Only owner can perform this function");
        _;
    }

    //function to set new owner
    function setNewOwner(address _newOwner) public onlyOwner{
        
        //to ensure that '0' addresses are not set as owner
        require(_newOwner != address(0), "Please enter a valid address");
        
        owner = _newOwner;
    }
}
