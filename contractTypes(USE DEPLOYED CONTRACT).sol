// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

contract ContractA{
    string message = "msg from contract A";

    function getMessage() public view returns (string memory){
        return message;
    }
    function getAddress() public view returns(address){
        return address(this);
    }
    function setMessage(string memory _message) public{
        message = _message;
    }
}

contract contractB{
    function getData() public view returns (string memory, address) {
        ContractA obj = ContractA(0xdDb68Efa4Fdc889cca414C0a7AcAd3C5Cc08A8C5);
        return (obj.getMessage(), obj.getAddress());
    }
}
