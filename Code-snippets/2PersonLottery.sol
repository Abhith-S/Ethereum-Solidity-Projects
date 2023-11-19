//A lottery contract
//The lottery should accept 1 ETH from two participants.
//Once two participants send 1 ETH each to the contract; the contract should pick a winner, 
//send 1.8 ETH to the winner, 
//and 0.2 ETH to a hardcoded address (developer address).

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Lottery{

    uint randomNonce;
    
    uint randomNumber;

    //store the winner address
    address public winner;

    //store the developer address, this is just a random address from remix
    address developer = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;

    //store the player
    mapping(uint => address)  player;
    uint playerID;

    //allowing one player to deposit fund only once
    mapping(address => bool) isPlayingNow;


    function depositFund() public payable{

        require(msg.value == 1 ether, "Amount to play is 1 ether, so deposit 1 ether");

        require(isPlayingNow[msg.sender] == false, "You cannot deposit ether again in this round, try in the next round" );

        //setting the player
        player[playerID] = msg.sender;

        //increment player ID
        playerID++;
        
        //set that player is playing this round
        isPlayingNow[msg.sender] = true;

        //if the contract has enough funds and there are 2 players then select a winner
        if(address(this).balance >= 2 ether && playerID == 2){
            selectWinner();
        }
    }

    // a function to generate random number
    function getRandomNumber() internal{

        // increase nonce
        randomNonce++;

        //get a random number
        randomNumber = uint(uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, randomNonce))) % playerID);

    }

    //function to select winner
    function selectWinner() internal {

        //generate random number
        getRandomNumber();

        //player at random number positon is selected as winner
        winner = player[randomNumber];

        //sent 1.8 ether to winner
        (bool sent, ) = winner.call{value: 1.8 ether}("");
        require(sent, "Failed to send Ether to winner");

        //send 0.2 ether to developer
        (bool isSent, ) = developer.call{value: 0.2 ether}("");
        require(isSent, "Failed to send Ether to developer");

        //set that addresses are not playing now , so they can play again in next round
        isPlayingNow[player[playerID - 1]] = false;
        isPlayingNow[player[playerID - 2]] = false;

        //reset playedID
        playerID = 0;
        
    }
}
