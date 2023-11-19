//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

//contract to study enum and their set,get,reset
contract Enums{
    
    //creating an enum to show various shipping status
    enum Status{
        None,
        Pending,
        Shipped,
        Completed,
        Rejected,
        Cancelled
    }

    //creating a variable of type Status
    Status public status;

    //using enum inside structs
    struct Order{
        address owner;
        Status status;
    }

    //function to view an enum, it will be returned as a number corresponding to the enum option . ie , 0 for None, 1 for Pending etc
    function getEnum()public view returns(Status){
        return status;
    }

    //function to set an enum by taking a number as input and using it for setting corresponding enum option
    function setEnum(Status _status)public {
        status = _status;
    }

    //update enum to a specific option like Shipped
    function setToShipped()public {
        status = Status.Shipped;
    }

    //reset enum to its default value
    //for an enum the default value will be its first value , so here it is None
    function resetEnum()public{
        delete status;
    }

}
