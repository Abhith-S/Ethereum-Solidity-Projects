//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

//contract to call other contracts
contract CallOtherContracts{

    //lets call the setX() from TestContract
    //here we are passing the address of TestContract and using it call the contract
    function setX(address _TestContractAddress, uint _x)external {
        TestContract(_TestContractAddress).setX(_x);
    }
                     
                     //OR
    //here we are doing the same thing as above but declaring the TestContractAddress as TestContract type
    // function setX(TestContract _TestContractAddress, uint _x)external {
    //     _TestContractAddress.setX(_x);
    // }



    //lets call the getX() from TestContract
    function getX(TestContract _TestContractAddress)external view returns(uint){
        return _TestContractAddress.getX();
    }
                    
                    //OR
    // function getX(TestContract _TestContractAddress)external view returns(uint x){
    //     x = _TestContractAddress.getX();



    //lets call the setXAndSendEther() from TestContract
    //here we used {value : msg.value} to send ether to the contract, {value : amount of ether}, here we usesd msg.value as we are forwarding all the ether from our function in this contract to the function in the other conteract
    function setXAndReceiveEther(TestContract _TestContractAddress, uint _x)external payable{
        _TestContractAddress.setXAndReceiveEther{value : msg.value}(_x);
    }




    //lets call the getXAndValue() from TestContract, it returns multiple values
    function getXAndValue(TestContract _TestContractAddress)external view returns(uint , uint){
        
        //returns the value
        // return _TestContractAddress.getXAndValue();

        //return the values to custom variable
        (uint x, uint value) = _TestContractAddress.getXAndValue();
        return (x,value);
    }

                    //OR
    // function getXAndValue(TestContract _TestContractAddress)external view returns(uint x, uint value){

    //     (x,value) = _TestContractAddress.getXAndValue();
    // }
}



contract TestContract{

    uint x;
    uint value = 123;

    function setX(uint _x)external {
        x = _x;
    }

    function getX()external view returns(uint){
        return x;
    }

    function getXAndValue()external view returns(uint , uint){
        return (x,value);
    }

    function setXAndReceiveEther(uint _x)external payable{
        x = _x;
        value = msg.value;
    }
}
