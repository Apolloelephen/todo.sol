// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ToDoList {
    struct Task {
        string title;
        string description;
        bool isDone;
    }

    Task[] public tasks;

    event TaskAdded(uint indexed taskId, string title, string description);
    event TaskDeleted(uint indexed taskId);
    event TaskMarkedDone(uint indexed taskId, bool isDone);

    function addTask(string memory _title, string memory _description) public {
        tasks.push(Task(_title, _description, false));
        emit TaskAdded(tasks.length - 1, _title, _description);
    }

    function deleteTask(uint _taskId) public {
        require(_taskId < tasks.length, "Task does not exist");
        delete tasks[_taskId];
        emit TaskDeleted(_taskId);
    }

    function markTaskDone(uint _taskId) public {
        require(_taskId < tasks.length, "Task does not exist");
        tasks[_taskId].isDone = true;
        emit TaskMarkedDone(_taskId, true);
    }

    function getTaskCount() public view returns (uint) {
        return tasks.length;
    }

    function getTask(uint _taskId) public view returns (string memory, string memory, bool) {
        require(_taskId < tasks.length, "Task does not exist");
        Task memory task = tasks[_taskId];
        return (task.title, task.description, task.isDone);
    }
}
