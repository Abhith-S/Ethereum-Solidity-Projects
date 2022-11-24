//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Smart contract to learn about fallback functions
contract FallbackFunction{

    //this function makes this contract payable
    //On remix you can after deploying the contract ,send funds to the contract by copying its address and using it in a low level interaction
    fallback() external payable {}

}
