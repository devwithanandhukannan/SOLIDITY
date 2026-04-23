// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

contract Employee {
    // init
    address public admin_wallet;
    struct Emp {
        string name;
        string department;
        string designation;
        uint salary;
        address wallet;
    }
    Emp employee;

    constructor () {
        admin_wallet = msg.sender;
    }

    //insert employee data
    function setEmployeeDetails(string memory _name, string memory _department, string memory _designation, uint _salary, address _employee_wallet) public {
        require(msg.sender == admin_wallet, "Only admin can set employee details");
        employee.name = _name;
        employee.department = _department;
        employee.designation = _designation;
        employee.salary = _salary;
        employee.wallet = _employee_wallet;
    }
    //get employee data
    function getEmployeeDetails() public view returns (string memory, string memory, string memory, uint, address) {
        return (employee.name, employee.department, employee.designation, employee.salary, employee.wallet);
    }
    //pay employee salary
    function paySalary() public payable {
    require(msg.sender == admin_wallet, "Only admin can pay salary");
    require(msg.value >= employee.salary, "Insufficient funds");

    (bool success, ) = payable(employee.wallet).call{value: employee.salary}("");
    require(success, "Failed to transfer salary");

    uint bal = msg.value - employee.salary;

    if (bal > 0) {
        (bool refundSuccess, ) = payable(msg.sender).call{value: bal}("");
        require(refundSuccess, "Failed to transfer balance");
    }
}
}
