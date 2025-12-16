// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClickWar {
    // Who is the current King?
    address public king;
    // Global counter
    uint256 public warCount;
    // Track individual scores
    mapping(address => uint256) public warriorScore;

    // The signal we send to the frontend (The Game Feed)
    event BattleUpdate(address indexed newKing, uint256 totalClicks);

    function attack() external {
        // Set the sender as the new King
        king = msg.sender;
        
        // Increase global war count
        warCount++;
        
        // Increase personal score
        warriorScore[msg.sender]++;

        // Broadcast the update instantly
        emit BattleUpdate(msg.sender, warCount);
    }
}
