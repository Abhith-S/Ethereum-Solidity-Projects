//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

//builiding a chat app using event
contract ChatApp{

    //event has 3 parameters address of sender and reciever and the message
    event Chat(address indexed from, address indexed to, string message);

    //function to set values to event variables
    function setChat(address _to, string calldata _message)external{

        //event can called using emit keyword
        emit Chat(msg.sender, _to, _message);
    }
}
