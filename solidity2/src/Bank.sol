// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

interface TokenRecipient {
    function tokensReceived(
        address sender,
        uint amount
    ) external returns (bool);
}

contract Bank is TokenRecipient {
    mapping(address => uint) public deposited;
    address public immutable token;

    constructor(address _token) {
        token = _token;
    }

    //ERC 向合约转token  回调
    function tokensReceived(
        address sender,
        uint amount
    ) external onlyToken returns (bool) {
        deposited[sender] += amount;
        return true;
    }

    modifier onlyToken() {
        require(msg.sender == token, "Not Allowed");
        _;
    }

    //要先从ERC20合约授权当前合约token数量
    function deposit(uint amount) public {
        bool flag = IERC20(token).transferFrom(
            msg.sender,
            address(this),
            amount
        );
        require(flag, "Trasfer from error");
        deposited[msg.sender] += amount;
    }

    function permitDeposit(
        uint amount,
        uint deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external {
        ERC20Permit(token).permit(
            msg.sender,
            address(this),
            amount,
            deadline,
            v,
            r,
            s
        );
        deposit(amount);
    }
}
