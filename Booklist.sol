// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;
import "./Token.sol";

contract Booklist is Token{
    uint256 public bookId;
    uint userId;
    struct Book{
        string title;
        uint256 price;
    }
    mapping(uint256 => Book) public books;

    function createBook(string memory _title, uint price) public{
        userId = issueToken();
        books[userId] = Book(_title, price);
    }

    function buyBook(uint _bookId, uint _price) public{
        require(books[_bookId].price == _price, "Price is not correct");
        changeOwner(_bookId,msg.sender);
    }

}
