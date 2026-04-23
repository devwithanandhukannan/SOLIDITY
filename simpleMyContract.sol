// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

contract Mycontract {
    string message;

    function getMessage () public view returns( string memory) {
        return message;
    }
    function setMessage(string memory _msg) public  {
        message = _msg;
    }
}
