//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//interface are used to get functions from other contracts without coping their entire code
//declaring the interface
//as convention we Use I infront of the contract we are gooing to get
interface ICounter{

    //now declare the functions we need from Counter.sol
    //here the functions are ending with semicolon
    function inc() external;

    //we can get the count here as a function because solidity converts the public state variables into functions
    function count() external view returns(uint);
}

contract CallInterface{

    uint public totalCount;

    //we are going to use the Counter.sol by passing its address here

    function sample(address _counterContractAddress)external {

        ICounter(_counterContractAddress).inc();

        totalCount = ICounter(_counterContractAddress).count();

    }

}

//Note : Counter.sol should be first deployed
