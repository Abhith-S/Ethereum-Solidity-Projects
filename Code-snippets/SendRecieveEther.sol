// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

//contract to send ether
contract SendEther{

    //3 ways to send ether out of contract
    //send, transfer, call

    //2 ways to recieve ether 
    constructor() payable{}

    //or
    receive() external payable{}

    //function to send using transfer
    //if failed transfer reverts the transaction back to orginal state
    function sendViaTransfer(address payable _to, uint _amount)external{
        _to.transfer(_amount);
    }

    //function to send using send
    //send returns a bool value , if it was succesfull or not
    function sendViaSend(address payable _to, uint _amount)external{
        bool isSent = _to.send(_amount);
        require(isSent, "Transaction failed");
    }

    //function to send using call
    //call returns bool value and a data
    function sendViaCall(address payable _to, uint _amount)external{
        (bool success, ) = _to.call{value : _amount}("");
        require(success, "call failed");
    }
}

//contract to receive ether 
contract ReceiveEther{

    //event that logs fund send and gasleft
    event Log(uint value, uint gasLeft);
    receive() external payable{
        emit Log(msg.value,gasleft());
    }

}
