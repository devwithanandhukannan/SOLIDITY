// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

contract ContractA{
    function getMessage() public pure returns (string memory){
        return "msg from contract A";
    }
    function getAddress() public view returns(address){
        return address(this);
    }
}

contract contractB{
    function getData() public returns (string memory, address) {
        ContractA obj = new ContractA();
        return (obj.getMessage(), obj.getAddress());
    }
}
