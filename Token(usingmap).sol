// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

contract Token {
    mapping (uint => address) Data;
    uint counter;

    function issueToken() public {
        counter++;
        Data[counter] = msg.sender;
    }

    function findUser(uint user_id) public view returns (address) {
        return Data[user_id];
    }

    function changeOwner(uint user_id, address new_address) public {
        Data[user_id] = new_address;
    }
}
