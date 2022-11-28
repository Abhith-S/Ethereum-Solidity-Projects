//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

//contract to make  a simple storage app (just stores  a string) based on study data location ie, calldata memory and storage
contract SimpleStorage{

    //state variable to store a text
    string public text;

    //function to set the text value.
    //using calldata as it is a function input and saves more gas than memory
    function setText(string calldata _text)external{
        text = _text;
    }

    //function to get the text value.
    //not really necessary as text is a public variable whose value can be viewed publically without a getter function but we create one for study purpose
    //here using memory as no updating or writing is happenning
    function getText()external view returns(string memory){
        return text;
    }
}
