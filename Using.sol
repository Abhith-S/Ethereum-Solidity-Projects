// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

//using is used for including a library within a contract

//lets create a library that returns the index of the element we searched for from an array
library ArrayLib{

    function find(uint[] storage arr, uint search)internal view returns(uint){

        for(uint i = 0; i< arr.length; i++){

            if(arr[i] == search)
            return i;
        }
        revert("not found");    
    }
}


contract TestArray{

    using ArrayLib for uint[];

    uint[] public arr = [1,2,3];

    function toFind()external view returns(uint){

        // return ArrayLib.find(arr, 2);

        //OR
        return arr.find(2);
    }

}
