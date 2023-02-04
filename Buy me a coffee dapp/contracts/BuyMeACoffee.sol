// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract BuyMeACoffee{

    //deployed to goerli at 0x429c36D05238556618267E55Fd19e6271cd1031d
    
    address payable public owner;

    //get the owner 
    constructor (){
       owner = payable(msg.sender);
    }

    //make contract be able to recieve funds
    receive() external payable{}

    //users will write memos with while tippping us
    //struct to make Memo datatype
    struct Memo {
        string name;
        string message;
        address senderAddress;
        uint timestamp;
        uint amount;

    }

    //create a Memo array to store all the memos
    Memo [] memos;

    //event to emit the memo
    //make address indexed for making it easier to search
    event showMemo(

        string name,
        string message,
        address indexed senderAddress,
        uint timestamp,
        uint amount
        
    );

    //function to send tip
    function buyCoffee(string calldata _name, string calldata _message)external payable{

        require(msg.value > 0.01 ether, "Send anything above 0.01 ETH");

        //push to memos array
        memos.push( Memo(

            _name,
            _message,
            msg.sender,
            block.timestamp,
            msg.value

        ));

        //emit the event 
        emit showMemo(
            _name,
            _message,
            msg.sender,
            block.timestamp,
            msg.value   
        );
    }

    //function to send money from contract to owner
    function withdrawTips()public {
        owner.transfer(address(this).balance);
    }
    
    //fucntion to get the memos
    function getMemos()public view returns(Memo [] memory){
        return memos;
    }
}