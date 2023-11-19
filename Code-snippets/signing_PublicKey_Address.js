// we are going to perform 4 tasks
//1.Hash a message
//2.Sign the message using Private key
//3.Recover the Public Key
//4.Generate address from Public key

//Note : the functions in order to work are needed to be replaced with variable in return statements and these variables are to be passed to subsequent functions
//these functions here are now separate  
//this code will only work after a few simple modifications
//console.log at different stages to see outputs

const { keccak256 } = require("ethereum-cryptography/keccak");
const { utf8ToBytes } = require("ethereum-cryptography/utils");
const secp = require("ethereum-cryptography/secp256k1");

//replace with any private key as you wish
const PRIVATE_KEY = "6b911fd37cdf5c81d4c0adb1ab7fa822ed253ab0ad9aa18d77257c88b29b718e";

//1.Hash a message
//function to convert message to bytes array and then hash it using keccak256
function hashMessage(message) {
    return (keccak256(utf8ToBytes(message)));
}
hashMessage("Hey man");


//2.Sign the message
//function to sign the hashed message . here we are using secp256k1 a type of ECDSA
//here the ".sign" method is got from 'secp' check docs at github.com/paulmillr/noble-secp...
async function signMessage(msg) {
   return secp.sign(hashMessage(msg), PRIVATE_KEY, {recovered: true});

}


//3.Recover the Public Key
//function to recover the public key using message signature and recoveryBit
async function recoverKey(message, signature, recoveryBit) {
  
  //recoverPublicKey() is from secp. check doc
  //message has to hashed to bytes array
    return secp.recoverPublicKey(hashMessage(message),signature, recoveryBit);
}



//4.Generate address from Public key
//function to generate address from the public key
//publicKey will be a Uint8Array so you can use the slice method to slice off the first byte.
//take the keccak hash of the rest of the public key (exclude 1st byte)
//take the last 20 bytes of the keccak hash. Once again, you can make use of the slice method. This is the address
function getAddress(publicKey) {

    return keccak256(publicKey.slice(1)).slice(-20);
               
               //OR

    //return (keccak256(publicKey.slice(1)).slice(keccak256.length-21));
}
