//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//contract to learn usage of libraries

//lets create a library that finds the biggest among two given uints
//libraries can't declare state variables
library Math{
    
    //declared as internal as it will be embedded into using contract
    //if declared public then this library have to be deployed separately
    function max(uint x, uint y)internal pure returns(uint){
        
        return (x > y ? x : y);
    }
}
contract Test{
    function checkMax(uint x, uint y)external pure returns(uint){

        //using the above declared Math library
        return Math.max(x,y);

    }
}

//now lets use a library with a state variable and enhance a datatype

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

    uint[] public arr = [1,2,3];

    //for the other way (OR option)
    using ArrayLib for uint[];

    function toFind()external view returns(uint){

        // return ArrayLib.find(arr, 2);

        //OR
        return arr.find(2);
    }

}
