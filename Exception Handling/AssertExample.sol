//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

contract assertSample{

    //using uint8 for showing assert example
    //mapping to map an address to amount of fund it holds
    mapping(address => uint8) public balanceRecieved;

    //function to deposit funds
    function deposit()public payable{

        //storing recieved funds corresponding to the send address
        //setting msg.value as uint8 as it is default uint256
        balanceRecieved[msg.sender] = uint8(msg.value);

        //adding assert statement to give error and rollback if false 
        assert(msg.value == uint8(msg.value));
    }

    //function to withdraw funds
    //set amount to uint8 to not have error during decrement of balance operation
    function withdraw(address payable _to, uint8 _amount)public {
        require(_amount <= balanceRecieved[msg.sender],"Not enough funds");
        balanceRecieved[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}
