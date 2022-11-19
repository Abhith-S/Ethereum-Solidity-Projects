//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract assertExample{
   
    uint public count;

    //function to increment count
    function increment(uint _x)public{

        //only execute rest of the code if _x is less than 10, else return a custom error message
        require(_x < 10, "_x should be less than 10");
        count += _x;
    }

    //function to decrement count
    function decrement(uint _x)public{

        //only execute rest of the code if _x is less than 10, else return a custom error message
        require(_x < 10, "_x should be less than 10");
        count -= _x;
    }
    
    //use 'assert' , function executes only if value of count = 10
    //else there will be error
    function assertTest()public {
        assert(count == 10);
        count += 10;
    }
    
}
