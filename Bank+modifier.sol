// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Bank {
    mapping (address => uint) Ledger;

    modifier balanceChecker(uint amount){
        require(Ledger[msg.sender]>=amount,"Insuffient money");
        _;
    }

    function Deposit() public payable {
        Ledger[msg.sender] += msg.value;
    }

    function Withdraw(uint amount) public balanceChecker(amount) {
        Ledger[msg.sender] -= amount;
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Transfer failed");
    }   

    function getBalance() public view returns (uint) {
        return Ledger[msg.sender];
    }
    function Transfer(uint amount, address _tran_acc) public balanceChecker(amount){       
        //ledger keep only the user balance 
        Ledger[msg.sender] -= amount;
        (bool success, ) = _tran_acc.call{value: amount}("");
        require(success, "Transfer failed");    
    }
}
