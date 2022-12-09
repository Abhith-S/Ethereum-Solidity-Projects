//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract KeccakHash{

    //function to hash its inputs
    function hash(string calldata text, uint num, address addr)external pure returns(bytes32 hashValue){

        //here abi.encode is used as the input of a keccak function is a bytes but here it is not 
        //so we have to convert it to bytes
        hashValue = keccak256(abi.encodePacked(text,num,addr));
    }

    //abi.encode vs abi.encodePacked
    
    //encodePacked returns a compressed and smaller output
    
    function ecode(string calldata text1, string calldata text2)external pure returns(bytes memory){
        
        return abi.encode(text1, text2);
    }
    function encodePacked(string calldata text1, string calldata text2)external pure returns(bytes memory){
        
        return abi.encodePacked(text1, text2);
    }

}
