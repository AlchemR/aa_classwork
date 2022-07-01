import * as APIUtil from '../util/todo_api_utils'


export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";

//  const RECEIVE_TODOS = "RECEIVE_TODOS";
//  const RECEIVE_TODO = "RECEIVE_TODO";
//  const REMOVE_TODO = "REMOVE_TODO";

export const receiveToDos = (todos) => {
    return {
        type: RECEIVE_TODOS, 
        todos, 
        // todos: todos, 
        
    };
};

export const receiveToDo = (todo) => {
    return {
        type: RECEIVE_TODO, 
        todo, 
        
    };
};

export const removeToDo = (id) => {
  return {
    type: REMOVE_TODO,
    id, 
  }
}

export const fetchTodos = () => (dispatch) =>{
  return APIUtil.fetchAllTodos().then(todo => dispatch(receiveToDos(todo)))
}

// window.receiveToDo = receiveToDo
// window.receiveToDos = receiveToDos
// export default receiveToDo ;