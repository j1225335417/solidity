// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
interface TokenRecipient {
    function tokensReceived(address user, uint amount) external returns (bool);
}

contract MyERC20 is ERC20Permit {
    using Address for address;
    constructor() ERC20(unicode"挖掘机", "WJJ") ERC20Permit("WJJ") {
        _mint(msg.sender, 10000 * 10 ** 18);
    }

    function transferWithCallback(
        address recipient,
        uint amount
    ) external returns (bool) {
        _transfer(msg.sender, recipient, amount);
        if (recipient.code.length > 0) {
            bool rv = TokenRecipient(recipient).tokensReceived(
                msg.sender,
                amount
            );
            require(rv, "No tokensReceived");
        }
    }
}
