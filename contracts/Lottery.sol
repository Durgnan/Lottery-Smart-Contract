// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.23;

contract Lottery {
    address public manager;
    address[] public players;

    constructor () public {
        manager = msg.sender;
    }

    function getPrize() public view returns (uint) {
        return address(this).balance;
    }

    function getPlayers() public view returns (address[] memory) {
        return players; 
    }

    function enter() public payable {
        require(msg.value > 0.01 ether);
        players.push(msg.sender);
        
    }

    function pickWinner() public restricted {
        // uint index = random() % players.length;
        // players[index].transfer(this.balance);
        address winner = players[random() % players.length];
        payable(winner).transfer(address(this).balance);
        delete players;

               
    }

    function random() private view returns (uint){
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players)));
    }

    modifier restricted() {
        require(msg.sender == manager);
        _;
    }
    
}