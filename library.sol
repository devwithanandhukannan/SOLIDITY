// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

library Mylibrary {
    function multiplay(uint _num1, uint _num2) public pure returns (uint){
        return (_num1 * _num2);
    }
}

contract Mycontract {
    using Mylibrary for uint;
    function getProduct(uint _num1, uint _num2) public pure returns (uint){
        return _num1.multiplay(_num2);
    }
}
