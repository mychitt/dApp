pragma solidity ^0.5.13;

contract StartStopUpdate{
    
    address public owner;
    
    bool public paused;
    
    constructor() public{
        owner = msg.sender;
    }
    
    function SendMoney() public payable{
        
    }
    
    function setPaused(bool _paused) public {
        require(msg.sender == owner, "You are not the owner-hahaha");
        paused = _paused;
    }
    
    function withdrawAllMoney( address payable _to) public {
        require(msg.sender == owner, "You are not the owner-hahaha");
        require(!paused, "Contract is paused!@@@@@");
        _to.transfer(address(this).balance);
        } 
    function destroySmartContact(address payable _to) public {
        require(msg.sender == owner, "You are not the owner");
        selfdestruct(_to);
    }
}