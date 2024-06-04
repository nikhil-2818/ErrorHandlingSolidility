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
