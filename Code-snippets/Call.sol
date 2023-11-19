//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//contract to call a function inside TestCall contract from Call contract using 'call'
contract TestCall{

    string public message;
    uint public x;

    event Log(string message);

    fallback() external payable{
        emit Log("fallback() called");
    }

    function foo(string calldata _message, uint _x)external payable returns(bool, uint){
        message = _message;
        x = _x;
        return(true, 999);
    }

}

contract Call{

    bytes public data;

    //we will call function foo
    //it takes the address of TestCall contract as input and is payable as we need to send ether for executing 'call'
    function callFoo(address _TestCallAddress)external payable{

        //'call' returns a bool value if it was successfull or not and data that is returned from the function in bytes format
        //'call' is used by the address of TestCall contract and a ether of 100wei is given to it
        //it is encoded and insidde the functoion to be called is specified with its arguements
        //the values to be passsed to the fucntion is also given
        (bool success, bytes memory _data) = _TestCallAddress.call{value: 100}(abi.encodeWithSignature("foo(string,uint256)","called foo",123));

        //to see if call is successful
        require(success, "call failed");

        //lets see what the data looks like
        data = _data;
    } 

    //lets call a function that doesn't exist in TestCall contract
    //as the function doesn't exist it will invoke fallback()
    //it doesn't have to be payacle as we are not sending any ether to it
    function doesNotExist(address _TestCallAddress)external{
        
        (bool success, ) = _TestCallAddress.call(abi.encodeWithSignature("doesNotExist()"));

        require(success, "call failed");
    }


}
