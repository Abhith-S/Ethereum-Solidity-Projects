//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Smart contract to show use of custom errors
contract CustomError{

    uint public count;

    //craete custom error called customError()
    //it can have input parameters 
    error customError(address owner, uint x);

    function customErrorFunction(uint _x)public {
        if(_x > 10){
            revert customError(msg.sender,_x);
        }else{
            count += _x;
        }
    }
}
