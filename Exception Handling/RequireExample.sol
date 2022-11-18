//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

contract requireSample{

    //mapping to store balance corresponding to  an address
    mapping(address => uint) public balanceRecieved;

    //function to recieve funds
    function deposit()public payable{
        balanceRecieved[msg.sender]  += msg.value;
    }

    //function to withdraw funds
    function withdraw(address payable _to, uint _amount)public {

    //     //if _amount is less or = awailable funds then withdraw
    //     if(_amount <= balanceRecieved[msg.sender]){

    //         //First update balance to prevent reentrancy attack
    //         balanceRecieved[msg.sender] -= _amount;

    //         //now transfer funds
    //         _to.transfer(_amount);
    //     }
    // }

    //              OR

            //using require we can send a custom error message. Here it is "Not enough funds"
            require(_amount <= balanceRecieved[msg.sender],"Not enough funds");

            //First update balance to prevent reentrancy attack
            balanceRecieved[msg.sender] -= _amount;

            //now transfer funds
            _to.transfer(_amount);
    }

}
