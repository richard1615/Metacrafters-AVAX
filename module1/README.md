# BasicFund Smart Contract

The `BasicFund` contract is a simple Ethereum smart contract that allows users to deposit and withdraw Ether from it. This contract is primarily designed to demonstrate the use of the `require()`, `assert()`, and `revert()` statements in Solidity.

## Features

- **Deposit Ether**: Users can deposit any amount of Ether into the contract.
- **Withdraw Ether**: Users can withdraw their Ether from the contract, given they have a sufficient balance.
- **Event Logging**: The contract emits events for both deposit and withdrawal actions for easier tracking.
  
## Functionalities and Usage

### Deposit

Users can deposit Ether into the contract by calling the `deposit` function and sending Ether:

```solidity
function deposit() external payable;
```

- The function uses `require()` to ensure that the sent amount is greater than 0.
  
### Withdraw

Users can withdraw Ether from the contract by specifying the amount they wish to withdraw:

```solidity
function withdraw(uint256 amount) external;
```

- The function uses `require()` to ensure the user has sufficient balance.
- The function also uses `assert()` as an internal check to verify that a user's balance doesn't go negative (theoretically, this situation should not arise because of the previous `require()` condition).
- In case of a failed Ether transfer, the function uses `revert()` to roll back state changes.

## Events

The contract emits two events:

- `Deposited`: Logged when a user deposits Ether.
- `Withdrew`: Logged when a user withdraws Ether.
