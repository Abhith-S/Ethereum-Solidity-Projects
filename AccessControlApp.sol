//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract AccessControlApp{

    //manage roles allowed to accounts
    //call functions based on roles assigned

    //mapping to map address to role if allowed
    //role => address => isAllowed
    //using bytes32 to hash role store offchain and save gas
    mapping(bytes32 => mapping(address => bool)) public roles;

    //create admin and user
    //its private as we are storing it offchain and its a constant , so naming convention - all caps
    bytes32 private constant ADMIN = keccak256(abi.encodePacked("ADMIN"));
    //0xdf8b4c520ffe197c5343c6f5aec59570151ef9a492f2c624fd45ddde6135ec42
    bytes32 private constant USER = keccak256(abi.encodePacked("USER"));
    //0x2db9fd3d099848027c2383d0a083396f6c41510d7acfd92adc99b6cffcf31e96

    //an event to show access given and revoked
    event AccessGranted(bytes32 indexed _role, address indexed _account);
    event AccessRevoked(bytes32 indexed _role, address indexed _account);

    //modifier to allow based on role
    modifier onlyRole(bytes32 _role){

        require(roles[_role][msg.sender], "You are not authorized");
        _;
    }

    //constructor to grant ADMIN role to contract deployer
    constructor(){

        _grantRole(ADMIN,msg.sender);    }


    //internal function to grant roles to accounts
    function _grantRole(bytes32 _role, address _account)internal{

        roles[_role][_account] = true;

        //emit an event to show access given
        emit AccessGranted(_role,_account);
    }

    //external function to grant roles to accounts
    //we only want admin to be able to do this 
    function grantRole(bytes32 _role, address _account)external onlyRole(ADMIN){

        _grantRole(_role,_account);
        //emit an event to show access given
        emit AccessGranted(_role,_account);
    }

    //function to revoke roles 
    function revokeRole(bytes32 _role, address _account)external onlyRole(ADMIN){
        
        roles[_role][_account] = false;

        //emit an event to show role revoked
        emit AccessRevoked(_role,_account);
    }
}
