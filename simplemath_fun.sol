// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

contract MathFun{
    function Max(uint num1, uint num2, uint num3) public pure returns (uint){
        return (num1 > num2) ? (num1 > num3 ? num1 : num3) : (num2 > num3 ? num2 : num3);
    }
    function getDigit(uint _num) public pure returns (string memory){
        require(_num<=9,"invalid Input");

        if(_num==0) return "Zero";
        else if(_num==1) return "One";
        else if(_num==2) return "Two";
        else if(_num==3) return "Three";
        else if(_num==4) return "Four";
        else if(_num==5) return "Five";
        else if(_num==6) return "Six";
        else if(_num==7) return "Seven";
        else if(_num==8) return "Eight";
        else if(_num==9) return "Nine";
        else return "Invalid Input";
    }

    function getSign(int _num) public pure returns (string memory){
        if(_num==0) return "Zero";
        if(_num>=0) return "Positive";
        else return "Negative";
    }

}
