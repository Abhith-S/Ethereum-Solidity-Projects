//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

//contract to create a Todo list app, to study insert,update and read from struct array
contract TodoList{

    //create a Todo struct with a text and a status to show if completed task
    struct Todo {
        string text;
        bool isCompleted;
    }

    //create a Todo struct array
    Todo[] public todoList;

    //function to add text to todoList
    function addText(string calldata _text)external{

        //we need to use .push as todoList is an array
        //then  specify what we are pushing
        todoList.push(Todo({
            text : _text,
            isCompleted : false
        }));
    }

    //function to update text inside todoList
    //here we have to spceify an index as to find which Todo text to update
    function updateText(uint _index, string calldata _text)external {

        //there are two  ways to add text here

        //method 1
        //its better to use if only index is modified, costs less gas
        todoList[_index].text = _text;

        // //method 2
        // //its better to use when multiple updates are done , then it will cost less gas
        // //this is done using a variable
        // //saving the struct at _index to a new 'Todo' variable 'todo'
        // Todo storage todo = todoList[_index];

        // //using the variable to update text
        // todo.text = _text;
    }

    //function to get text and status from todoList at a specific index
    function getText(uint _index)external view returns(string memory, bool){
        return (todoList[_index].text ,todoList[_index].isCompleted );
    }

    //fucntion to toggle the state of isCompleted at a specific index
    function toggleIsCompleted(uint _index)external{

        //using "!" to chanfge state from true to false or false to true
        todoList[_index].isCompleted = !todoList[_index].isCompleted;
    }

}
