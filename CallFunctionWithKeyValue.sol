// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//contract to show how to call functions and pass in inputs in any order using key value pairs
contract CallFunctionWithKeyValue{

    function sampleFunction(uint a, uint b, uint c, address addr, bool isTrue)public pure returns(uint, address , bool){
        return ((a+b+c),addr,isTrue);
    }

    function callFunctionWithKeyValue()external pure returns(uint, address , bool){

        //passing arguements of sample function as key value pairs
        return (sampleFunction({
            b: 10,
            addr: address(0),
            a: 12,
            c: 23,
            isTrue: false

        }));
    }
}
