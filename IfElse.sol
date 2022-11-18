//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForLoop{

    // a function that uses 'for' loop to take the aggregate sum of all values from 1 upto a limit
    function forLoopExample(uint _limit)public pure returns(uint){

        uint aggregateSum;

        //For loop
        for(uint i = 1; i <= _limit; i++){
            aggregateSum += i;
        }
        return aggregateSum;

    }
}

contract WhileLoop{

    // a function that uses 'while' loop to take the aggregate sum of all values from 1 upto a limit
    function whileLoopExample(uint _limit)public pure returns(uint){

        uint aggregateSum;
        uint i = 1;

        //While loop
        while(i <= _limit){
            aggregateSum += i;
            i++;
        }
        return aggregateSum;

    }
}
