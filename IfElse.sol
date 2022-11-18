//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IfElse{

    //a simple function that takes a number as input and return if it is a positive , negative or zero
    function sample(int _num)public pure returns(string memory){
     
        //check if _num greater than 0, if yes then it is positive
        if(_num > 0){
            return "Positive Number";

        //check if _num equal to 0, if yes then it is Zero
        }else if(_num == 0){
            return "Zero";

        //if none of the conditions above are true then _num is negative
        }else{
            return "Negative Number";
        }

        //else state can also be written after ending of 'else if' without 'else' keyword , using only just a return statement as:
        //return "Negative Number";
    }
}

contract IfElseTernary{

    function sample(int _num)public pure returns(string memory){
        
        // if(_num > 0){
        //     return "Positie Number";
        // }
        // return "Negative Number";


        //the above 'if' and a 'else' statement can be written on a single line using 'ternary operator' as:
        return _num > 0 ? "Positive Number" : "Negative Number" ;
    }
}

