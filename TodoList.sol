pragma solidity ^0.8.3;

contract TodoList{
    struct Todo {
        string text;
        bool completed;
    }
    Todo[] public todos;

    function create(string calldata _text ) external {
        todos.push(Todo({
            text: _text,
            completed: false
        }));
    }
    function updateText(uint _index, string calldata _text) external {
        // 35138 gas
        // todos[_index].text = text;
        // todos[_index].text = text;
        // todos[_index].text = text;
        todos[_index].text = _text;

        // 34578 gas 
        // Todo storage todo = todos[_index];
        // todo.text  =_text ; 
        // todo.text  =_text ; 
        // todo.text  =_text ; 
        // todo.text  =_text ; 

    }
    function get(uint _index) external view returns (string memory, bool){
        Todo memory todo = todos[_index];
        return (todo.text, todo.completed);
    }
    function toggleCompleted(uint _index) external {
        todos[_index].completed = !todos[_index].completed;
    }
}