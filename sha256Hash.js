//Problem :
//Given a SHA256 hash, find the color input that would generate that hash. You can assume that all the hashes be generated only from colors provided in the COLORS array.

   // 1. To take the hash of a color, first use utf8ToBytes to translate the string to bytes. Then, use sha256 to hash it.
   // 2. When you want to compare two hashes, first use toHex to turn each hash from a Uint8Array to a string of hexadecimal characters.

//solution : 

const { sha256 } = require("ethereum-cryptography/sha256");
const { toHex, utf8ToBytes } = require("ethereum-cryptography/utils");

// the possible colors that the hash could represent
const COLORS = ['red', 'green', 'blue', 'yellow', 'pink', 'orange'];

// given a hash, return the color that created the hash
function findColor(hash) {

    //convert utf8 strings to bytes, we use utf8ToBytes()
    //take sha256 hash of these bytes, we use sha256()
    //to compare we need to first convert the hash into string so we use toHex()
    //now we loop through the array comparing the strings
    for(let color of COLORS){
        if(toHex(hash) == toHex(sha256(utf8ToBytes(color)))){
         return color;
        }
 
    }
}

//test out the code using getting the hash of the color names ,ie, the strings like red,green etc and then passing them to findColor("input hash here");
