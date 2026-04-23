// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

contract leapYear{
    function checkLeapYear(uint _year) public pure returns(bool){
        if( _year % 4 == 0 && _year % 100 != 0 || _year % 400 == 0){
            return true;
        }return false;
    }
}