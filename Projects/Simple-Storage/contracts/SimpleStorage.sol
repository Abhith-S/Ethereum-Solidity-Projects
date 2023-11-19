// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SimpleStorage{

    string message = "Hello World";

    function store(string memory _message) public {
        message = _message;
    }

    function retrieve() public view returns(string memory){
        return message;
    }
}