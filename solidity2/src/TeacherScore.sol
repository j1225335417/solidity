// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;
contract Score {
    mapping(address => uint) public students;

    address public teacher;
    address owner;
    //因为 uint默认为0 用最大值作为 0 的成绩
    uint constant UNINITIALIZED = type(uint).max;
    event Debug(address sender, address teacher);
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
        emit Debug(msg.sender, teacher); // 调试日志记录
        require(msg.sender == teacher, "Disallowed opration");
        _;
    }

    function getScore(address studentAddr) external view returns (uint) {
        uint score = students[studentAddr];
        if (score == UNINITIALIZED) {
            return 0;
        }
        return score;
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
