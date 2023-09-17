// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BasicFund {
    mapping(address => uint256) public balances;
    
    event Deposited(address indexed user, uint256 amount);
    event Withdrew(address indexed user, uint256 amount);
    
    function deposit() external payable {
        // Using require to check if the sent amount is greater than 0
        require(msg.value > 0, "Amount should be greater than 0");
        
        balances[msg.sender] += msg.value;
        
        emit Deposited(msg.sender, msg.value);
    }
    
    function withdraw(uint256 amount) external {
        // Using require to check if the user has enough balance
        require(balances[msg.sender] >= amount, "Insufficient balance");
        
        balances[msg.sender] -= amount;
        
        // Using assert to make sure the user's balance doesn't go below 0 (although it's theoretically impossible because of the previous require)
        assert(balances[msg.sender] >= 0);
        
        // In case the transfer fails, we want to revert any state changes
        (bool success, ) = msg.sender.call{value: amount}("");
        if(!success) {
            revert("Transfer failed");
        }
        
        emit Withdrew(msg.sender, amount);
    }
}
