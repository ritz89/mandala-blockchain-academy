// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract BuggyContract {
    uint private count = 0;
    string messages;
    bool public isPaused;
    address owner;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    // Bug 1
    constructor() {
        owner = msg.sender;
    }

    // Bug 2
    function increment(uint amount) public {
        count += amount;
    }

    // Bug 3
    function getCount() public view returns (uint) {
        return count;
    }

    // Bug 4
    function divideCount(uint divisor) public returns (uint) {
        require(divisor != 0, "Cannot divide by zero");
        count = count / divisor;
        return count;
    }

    // Bug 5
    function setMessage(string memory message) public {
        messages = message;
    }

    // Bug 6
    function sumNumbers(uint n) public pure returns (uint) {
        return n * (n + 1) / 2;
    }

    // Bug 7
    function setCountWithMultiplication(uint x, uint y) public {
        count = x * y;
    }

    // Bug 8
    function resetCount() public onlyOwner {
        count = 0;
    }

    // Bug 9
    function togglePause() public onlyOwner {
        isPaused = !isPaused;
    }
}
