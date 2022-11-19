//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RevertExample{

    uint public count;
    
     //function to increment count
    function increment(uint _x)public{

        //only execute rest of the code if _x is less than 10, else return a custom error message
        
        if(_x > 10){
            revert("_x should be less than 10");
        }else{
            count += _x;
        }
    }
    
    /function to decrement count
    function decrement(uint _x)public {

        //only execute rest of the code if _x is less than 10, else return a custom error message
        
        //Using revert
        if(_x > 10){
            revert("_x should be less than 10");
        }
        else{
            count += _x;
        }
    }
}
