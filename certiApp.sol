// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CertiApp{
    uint certificate_id = 0;
    address admin;
    struct certificate{
        string name;
        string course_name;
        string grade;
        string date;
    }
    mapping(uint=>certificate) public certificates;
    constructor () {
        admin = msg.sender;
    }
    modifier checkAdmin() {
        require(msg.sender == admin, "You are not admin");
        _;
    }

    function setCertificate(string memory _name, string memory _course_name, string memory _grade, string memory _date) public checkAdmin {
        certificate_id++;
        certificates[certificate_id] = certificate(_name, _course_name, _grade, _date);
    }

    function countCertificate() public view returns(uint) {
        return certificate_id;
    }
    // function getCertificateByAddress(address _address) public view returns(certificate memory){
    //     return certificates[_address];
    // }

}
