//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

//contract to study mappings
//declare simple and nested mapping
//get , set , delete and update mappings
contract Mapping{

    //simple mapping
    mapping(address => uint) public balances;

    //nested mapping 
    //this is to set if an address is a friend of another address
    mapping(address => mapping(address => bool)) public isFriend;

    function example()public {

        //set a value to mapping using key
        balances[msg.sender] = 123; 

        //get a value from mapping using key
        uint bal = balances[msg.sender]; //123

        //update a mapping
        balances[msg.sender] = 456; //456

        balances[msg.sender] += 142; //456 + 142

        //deleting the mapping value 
        //this deletes value corresponding to the address
        delete balances[msg.sender];

        //set nested mapping
        //lets set that msg.sender is a friend of this contract
        isFriend[msg.sender][address(this)] = true;

    }

}
