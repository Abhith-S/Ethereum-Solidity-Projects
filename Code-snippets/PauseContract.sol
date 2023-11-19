//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Smart Contract that allows owner to pause withdrawal of funds
contract PauseContract{

    //create variable of address type to store owner or msg.sender address
    address owner;

    //create bool type variable paused
    bool isPaused;

    //constructor initialize msg.sender as onwer on contract deployment , its done only once
    constructor(){

        //msg.sender returns address of person who deployed the smart contract
        owner = msg.sender;
    }

    //function to recieve funds
    function recieveFund()public payable{}

    //function to set isPaused to true or false. Only owner can perform this task. 
    function pauseContract(bool _isPaused)public{

        //only allow setting ifPaussed if person calling the function is the owner
        require(msg.sender == owner,"Only owner can perform this function. You are not the owner");

        isPaused = _isPaused;
    }

    //function that only allows owner to withdraw all the funds
    //funds can be send to any address specified by owner
    function withdrawFund(address payable _to)public {

        //if isPaused = false then we can withdraw , else no withdraws allowed
        require(isPaused == false, "Smart Contract is paused");

        //only allow withdrawal if person calling the withdraw function is the owner
        require(msg.sender == owner,"Only owner can perform this function. You are not the owner");

        //transfer funds to '_to' address specified, 'address(this).balance' gives the current balance in this contract
        _to.transfer(address(this).balance);
    }
}
