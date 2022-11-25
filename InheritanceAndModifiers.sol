//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

//2 contracts to study Inheritance and using modifiers with by inheritance

//a contract for all the checks and initializations
contract Owned{

    address owner;

    //constructor to set owner
    constructor(){
        owner = msg.sender;
    }

    //modifier to validate if owner
    modifier isOwner(){

        //only owner can withdraw funds
        require(msg.sender == owner,"You are not the owner");

        _;
    }
}


//contract to deposit and withdraw funds, inherits contract Owned and all its properties
contract depositWithdraw is Owned{

     uint balance;

    //fallback function to recieve funds
    fallback() external payable {
        balance = msg.value;
    }

    //function to withdraw funds
    function withdraw(uint _amount, address payable _to)public isOwner{

        //make sure to have enough balance
        require(_amount <= balance, "Not enough balancce");

        balance -= _amount;
        _to.transfer(_amount);


    }


}
