# Error Handling in Solidity

## Overview

This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The `Error` contract has three function that shows the functionality demonstrating the use of error handling mechanism in solidity. This contract includes examples of using `require`, `revert`, and `assert` Methods to enforce conditions and ensure the contract behaves as expected.
The three methods that consitutes error handling are descricbe below:
1. **require()**: Used to validate certain conditions before further execution of a function. It takes two parameters as an input.The first parameter is the condition that you want to validate and the second parameter is the message that will be passed back to the caller if the condition fails. If the condition is satisfied, then the execution of the function continues and the execution jumps to the next statement.
2. **revert()**: Can be used to flag an error and revert the current call. You can also provide a message containing details about the error, and the message will be passed back to the caller. Causes the EVM to revert all the changes made to the state, and things return to the initial state or the state before the function call was made. It also helps in saving gas.
3. **assert()**: takes only one parameter as input. You pass a condition to assert(), and if the condition is true, then the function execution continues and the execution jumps to the next statement in the function.

## Contract Details

### Variables

- `balances`: A mapping that stores the balance of each address.
### Function Usage
-> **require**: Used in the deposit function to ensure that the deposit amount is greater than zero. If the condition is not met, the transaction is reverted with an error message.

-> **revert**: Used in the withdraw function to revert the transaction if the withdrawal amount exceeds the balance.

-> **assert**: Used in the check function to verify that the balance is non-negative. If the condition fails, it indicates a critical error in the contract logic.

## Usage
to uses this contract or exectue you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., ErrorHandling.sol). Copy and paste the following code into the file:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract Error{

    mapping(address => uint) public balances;

    //function to demonstrate the usage of require().
    function deposit(address _address,uint _value) public payable{
        require(_value > 0," the amount should be greater than zero");
        balances[_address] += _value;
    }
    //function to demostrate the usage of revert().
    function withdraw(address _address, uint _amount) public{
        if(_amount > balances[_address]){
            revert("Withdraw amount should be less than balance");
        }
        balances[_address] -= _amount;

    }
    //function to demostratet the usage of assert().
    address public owner;

    function check(address _address) public view returns (bool) {
        assert(balances[_address] >= 0);
        return true;
    }

}
```
To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.25" (or another compatible version), and then click on the "Compile ErrorHandling.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "ErrorHandling" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can use the deployed contract interface to call the deposit, withdraw and check functions.You can enter addresses and values to test the functionality. After entering data, click on "transact" button to execute the function and retrieve the balance, amount and do testing. 

## Contact
For any questions or suggestions, feel free to open an issue or contact the repository owner.

Mail - nikhil.mkbn@gmail.com
