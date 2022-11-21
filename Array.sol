//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Smart contract to learn about arrays and array operations
contract Array{

    //create a dynamic array
    uint[] public dynamicArray;

    //create fixed array (of size 5)
    uint[5] public fixedArray;

    //initialize dynamic array
    uint[] public num = [1,2,3,4,5];

    //initialize fixed array
    uint[4] public numFixed = [6,7,8,9];

    //Array operations

    //function to perform various array operations
    function arrayOperations()public {

        //add to array
        num.push(6);

        //update array (arrayName[index] = newValue; )
        num[2] = 9;

        //delete from array (delete arrayName[index];), value deleted will be replaced by default value of datatype
        delete num[3];

        //remove last element from array (pop)
        num.pop();

        //get array length
        uint arrayLength;
        arrayLength = num.length;

        //create array in memory
        //it is of fixed size
        uint[] memory memoryArray = new uint[](5);

        //update memory array
        memoryArray[1] = 5;
    }

    //function to return array
    function returnArray() public view returns(uint[] memory){
        return num;
    }

}
