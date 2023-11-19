//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//delegatecall is a low level function similar to call.
//When contract A executes delegatecall to contract B, B's code is executed with contract A's storage, msg.sender and msg.value.

//contract to call a function (testVars) inside TestDelegateCall contract from DelegaetCall contract using 'delegatecall'
contract TestDelegateCall{

    uint public num;
    address public sender;
    uint public value;

    function setVars(uint _num)external payable{
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }

}

contract DelegatCall{

    uint public num;
    address public sender;
    uint public value;

    function setVars(address _TestDelegateCallAddress, uint _num)external payable{

        //'call' returns a bool value if it was successfull or not and data that is returned from the function in bytes format
        // (bool success, bytes memory data) = _TestDelegateCallAddress.delegatecall(abi.encodeWithSignature("setVars(uint256)",_num));
        
        //OR

        //benefit of this method is that it's not using a string , so if we change the signature
        //of TestDelegateCall contract we don't have to update it here
        (bool success, bytes memory data) = _TestDelegateCallAddress.delegatecall(abi.encodeWithSelector(TestDelegateCall.setVars.selector,_num));



        //to see if delegatecall is successful
        require(success, "delegatecall failed");
    }
}
