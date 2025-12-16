// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SpamTarget {
    uint256 public count;
    mapping(address => uint256) public scores;

    function hit() external {
        unchecked {
            count++;
            scores[msg.sender]++;
        }
    }
}

