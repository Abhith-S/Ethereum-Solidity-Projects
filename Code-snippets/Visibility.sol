// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

//types :
//private : can only be used inside this contract
//internal : can only be used inside this contract and inherited contract
//public ; can be used inside or outside this contract
//external : can only be used outside this contract

contract Sample1{

    uint private a = 10;
    uint internal b = 20;
    uint public c = 30;

    function f1() private {}
    function f2() internal {}
    function f3() public {}
    function f4() external {}

    //lets use a function to see which of these functions and variables we can use
    function call() public{
       //we can use all 3 variables
        a + b + c;
        
        //we can't call f4() as it is only allowed from outside contract
        f1();
        f2();
        f3();
    }
    

}

//inherits Sample1
contract Sample2 is Sample1{

    //lets use a function to see which of these functions and variables we can use
    function call2() public{

       //we can use all 2 variables
       //can't use a as it is private
        b + c;
        
        //can't call f1 as its private
        //we can't call f4() as it is only allowed from outside contract , even though we are outside the contract as this contract inherits contract sample1 its the same as the dunction beimg inside this contract
        f2();
        f3();
    }

}
