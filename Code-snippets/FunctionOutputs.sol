//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Smart contract get function outputs in other functions, name the outputs etc
contract FunctionOutputs{

    //function that returns several values
    function returnMany() public pure returns(uint, bool){
        return(1, true);
    }

    //function with named return values
    function returnNamed()public pure returns(uint num, bool boolValue){

        // return (1, true);

        //OR

        num = 1;
        boolValue = true;
    }

    //to capture the output of another function we use destructuring assignment
    //capturing return values of returnMany()
    function destructuringAssignment()public pure returns(uint num, bool boolValue){

        (num, boolValue) = returnMany();
    }

}
