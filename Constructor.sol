//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Smart contract showing use of constructors
contract ConstructorContract1{

    address public owner;

    //constructor without parameters
    constructor(){
        owner = msg.sender;
    }
}

//solidity only allows one constructor per contract
contract ConstructorContract2{

    uint public num;
    
    //constructor with parameters
    constructor(uint _num){
        num = _num;
    }
}
