// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.19;

contract Lottery {
    address public manager;

    constructor (address name) public {
        manager = msg.sender;
         
    }
    
}