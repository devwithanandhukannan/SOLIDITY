// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

contract BookStore {
    enum Available { True, False}
    struct Book{
        string title;
        address owner;
        uint price;
        Available available;
    }
    modifier check_owner (){
        require(myBook.owner == msg.sender,"invalid user");
        _;
    }

    Book public myBook;
    function setBookAvailable_true()public check_owner {
            myBook.available = Available.True;
    }
    function setBookAvailable_false()public check_owner {
            myBook.available = Available.False;
    }
    constructor (string memory _title, uint _price) {
        myBook.title = _title;
        myBook.owner = msg.sender;
        myBook.price = _price;
        myBook.available = Available.False;
    }

    function getBook() public view returns ( string memory, address, uint ,bool) { 
        return (myBook.title, myBook.owner, myBook.price, myBook.available == Available.True);
    }
    function buyBook() public payable {
        require(myBook.available == Available.False, "Book not available");
        require(msg.value >= myBook.price, "Insufficient payment");
        (bool success ,)=payable (myBook.owner).call{value: myBook.price}("");
        require(success, "Payment failed");
        myBook.owner = msg.sender;
        myBook.available = Available.False;
        
        uint balance = msg.value - myBook.price;
        if(balance>0){
            (success,)=payable (msg.sender).call{value: balance}("");
        }
        }
    }
