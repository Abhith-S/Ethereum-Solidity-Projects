//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionModifier{

    uint public count;
    bool public isPaused;

    function setPause(bool _isPaused)public{
        isPaused = _isPaused;
    }

    //declaring function modifiers
    //function modifers can have parameters passed (optional)

    //function modifier without passing parameter
    modifier whenNotPaused(){
        require(!isPaused, "Paused");

        //' _; ' specifies solidity compiler to go to function next and execute codes in it
        _;
    }


    //function modifier with parameter passed
    modifier check_xValue(uint _x){
        
        //only execute rest of the code if _x is less than 10, else return a custom error message
        require(_x < 10, "_x should be less than 10");

        //' _; ' specifies solidity compiler to go to function next and execute codes in it
        _;
    }

    //a sandwich function modifier, ie, it first executes the modifier then goes back to execute the function and the returns to the modifier
    modifier sandwich(){
        
        //execute this code first
        count += 100;

        //' _; ' specifies solidity compiler to go to function next and execute codes in it
        _;

        //come back from function and then execute this code
        count += 100;
    }


    //function to increment count
    function increment(uint _x)public whenNotPaused check_xValue(_x) sandwich{
        count += _x;
    }

    //function to decrement count
    function decrement(uint _x)public whenNotPaused check_xValue(_x) sandwich{
        count -= _x;
    }

}
