// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Bank {
    mapping (address => uint) Ledger;

    function Deposit() public payable {
        Ledger[msg.sender] += msg.value;
    }

    function Withdraw(uint amount) public {
        require(Ledger[msg.sender]>=amount,"Insuffient money");
        Ledger[msg.sender] -= amount;
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Transfer failed");
    }   

    function getBalance() public view returns (uint) {
        return Ledger[msg.sender];
    }
    function Transfer(uint amount, address _tran_acc) public {
        require(Ledger[msg.sender]>=amount,"Insuffient money");
        //ledger keep only the user balance 
        Ledger[msg.sender] -= amount;
        (bool success, ) = _tran_acc.call{value: amount}("");
        require(success, "Transfer failed");    
    }
}
