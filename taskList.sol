// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TodoList{
    struct Task {
        string content;
        bool completed;
        bool exit;
    }

    mapping(address => mapping (uint => Task)) public tasks;
    mapping (address => uint ) private taskCounter; 

    function addTask(string memory _content) public {
        uint id = taskCounter[msg.sender];
        tasks[msg.sender][id] = Task({
            content: _content,
            completed: false,
            exit: true
        });
        taskCounter[msg.sender]++;
    }

    function updateTask(uint _id, string memory _content, bool _completed) public {
        require(tasks[msg.sender][_id].exit, "Task does not exist");
        tasks[msg.sender][_id].content = _content;
        tasks[msg.sender][_id].completed = _completed;
    }

    function getTaskCount() public view returns (uint) {
        return taskCounter[msg.sender];
    }
    function getTask(uint _id) public view returns (Task memory) {
        require(tasks[msg.sender][_id].exit, "Task does not exist");
        return tasks[msg.sender][_id];
    }
}
