// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

contract EventRegistry {
    address[] public guestList;
    uint maxGuest = 10;

    function register() public {
        require(guestList.length < maxGuest, "Guest list is full");
        guestList.push(msg.sender);
    }
    function getCount() public view returns (uint) {
        return guestList.length;
    }
}
