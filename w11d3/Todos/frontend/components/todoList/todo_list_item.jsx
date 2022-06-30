import React from 'react'


const ToDoItem = (props) =>{
  console.log("todoitem props", props)
  let toggletext;
//   const todoList = props.todos.map((el) => { return <li key={el.id}>{el.title}</li> })

function helperRemove(e){
e.preventDefault();
return props.removeToDo(props.todo.id)
}

function toggleDone(e){
e.preventDefault();
props.todo.done = !props.todo.done
props.receiveTodo(props)
}

if (props.todo.done) {toggletext = "undo"} else {toggletext = "finished"}

return(
      <li className={toggletext}>
          {props.todo.title} | {props.todo.body}  
    <button onClick={toggleDone}>{toggletext}</button>
          <button onClick={helperRemove}>remove</button>
      </li>
  )}

export default ToDoItem;