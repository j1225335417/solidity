// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Score {
    mapping(address => uint) public students;

    address teacher;
    address owner;

    constructor() {
        owner = msg.sender;
    }
    function setTeacher(address t) public onlyOwner {
        teacher = t;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "Disallowed opration");
        _;
    }

    modifier onlyTeacher() {
        require(address(0) != teacher, "Set first teacher");
        require(msg.sender == teacher, "Disallowed opration");
        _;
    }

    function getScore(address studentAddr) external view returns (uint) {
        return students[studentAddr];
    }

    function setScore(address studentAddr, uint score) external onlyTeacher {
        require(
            students[studentAddr] == 0,
            "The student's score already exists"
        );
        students[studentAddr] = score;
    }
}

interface IScore {
    function setScore(address studentAddr, uint score) external;
}

contract Teacher {
    IScore score;
    constructor(address scoreAddr) {
        score = IScore(scoreAddr);
    }

    function setScore(address studentAddr, uint data) public {
        score.setScore(studentAddr, data);
    }
}
