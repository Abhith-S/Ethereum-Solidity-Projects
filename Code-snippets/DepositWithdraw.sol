//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//smart contract that allows anyone to deposit funds, but only the owner can withdraw it to any account
contract DepositWithdraw{

    //create variable of address type to store owner or msg.sender address
    address owner;

    //constructor initialize msg.sender as onwer on contract deployment , its done only once
    constructor(){

        //msg.sender returns address of person who deployed the smart contract
        owner = msg.sender;
    }

    //function to recieve funds
    function recieveFund()public payable{}

    //function that only allows owner to withdraw all the funds
    //funds can be send to any address specified by owner
    function withdrawFund(address payable _to)public {

        //only allow withdrawal if person calling the withdraw function is the owner
        require(msg.sender == owner,"Only owner can perform this function. You are not the owner");

        //transfer funds to '_to' address specified, 'address(this).balance' gives the current balance in this contract
        _to.transfer(address(this).balance);
    }
}
