//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//importing contract that sets msg.sender as owner and gives other functionalities
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

//creating another contract for allowance
contract Allowance is Ownable{

    //Add an event to show the allowance change
    //here indexed is used so that we can search the address from the event chain
    event AllowanceChanged(address indexed _byWho, address indexed _forWhom, uint _oldAmount, uint _newAmount);

    //mapping to map address to corresponding allowance
    mapping(address => uint) public allowance;

    //function to set allowance to addresses
    //the onlyOwner modifier here comes from openzepplin ownable.sol
    function setAllowance(address _to, uint  _amount)public onlyOwner{

        //emit event to show allowance change
        emit AllowanceChanged(msg.sender, _to, allowance[_to], _amount);

        allowance[_to] = _amount;
    }


    //funtion to reduce allowance
    function reduceAllowance(address _to, uint _amount)internal{

        //emit event to show allowance change
        emit AllowanceChanged(msg.sender, _to, allowance[_to], (allowance[_to] - _amount));


        allowance[_to] -= _amount;
    }

    //function to disable the renounceOwnership()  function
    function renounceOwnership() override public pure{
        revert("Can't do this task");
    }
}
