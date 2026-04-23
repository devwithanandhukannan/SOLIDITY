// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

contract Book {
    string title;
    address owner;
    uint price;
    bool available;

    function setBookAvailable_true()public {
        if(owner == msg.sender){
            available = true;
        }
    }
    function setBookAvailable_false()public {
        if(owner == msg.sender){
            available = false;
        }
    }

    function setBook(string memory _title, uint _price) public {
        title = _title;
        owner = msg.sender;
        price = _price;
        available = false;
    }

    function getBook() public view returns ( string memory, address, uint ,bool) { 
        return (title, owner, price, available);
    }
    function buyBook() public payable {
        if(msg.value >= price && available){
            (bool success ,)=payable (owner).call{value: price}("");
            if(success){
                owner = msg.sender;
                available = false;
                uint balance = msg.value - price;
                if(balance>0){
                    (success,)=payable (msg.sender).call{value: balance}("");
                }
            }
        }
    }
}
