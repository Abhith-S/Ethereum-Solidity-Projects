//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Counter{
    uint public count;

    function inc() public {
        count++;
    }

    function dec() public {
        count--;
    }
}
