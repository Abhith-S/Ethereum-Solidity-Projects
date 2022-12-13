//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract FunctionSelector{

    //passing the function transfer in contract Recieve as strting
    //first 4 bytes of the hash of the function is the function selector
    function getSelector(string calldata _function)external pure returns(bytes4){

        return bytes4(keccak256(bytes(_function)));

        //this function will return 0xa9059cbb
    }

}

contract Recieve{

    //event to show the data that was sent to contract
    event Log(bytes data);

    function transfer(address _to, uint _amount)external{
        emit Log(msg.data);

        //0xa9059cbb0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc40000000000000000000000000000000000000000000000000000000000000001
        //the above is the data from the function we got after deployment
        //its first 4 bytes is the function selector or the hash of the function with the parameters excluding the arguements passsed
        //the rest of the data is the function arguements passed
    }
}
