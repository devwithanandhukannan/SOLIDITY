
// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

contract BookStore {
    struct Book{
        string title;
        address owner;
        uint price;
        bool available;
    }
    Book public myBook;
    function setBookAvailable_true()public {
        if(myBook.owner == msg.sender){
            myBook.available = true;
        }
    }
    function setBookAvailable_false()public {
        if(myBook.owner == msg.sender){
            myBook.available = false;
        }
    }

    constructor (string memory _title, uint _price) {
        myBook.title = _title;
        myBook.owner = msg.sender;
        myBook.price = _price;
        myBook.available = false;
    }

    function getBook() public view returns ( string memory, address, uint ,bool) { 
        return (myBook.title, myBook.owner, myBook.price, myBook.available);
    }
    function buyBook() public payable {
        require(myBook.available, "Book not available");
        require(msg.value >= myBook.price, "Insufficient payment");
        (bool success ,)=payable (myBook.owner).call{value: myBook.price}("");
        require(success, "Payment failed");
        myBook.owner = msg.sender;
        myBook.available = false;
        uint balance = msg.value - myBook.price;
        if(balance>0){
            (success,)=payable (msg.sender).call{value: balance}("");
        }
        }
    }
