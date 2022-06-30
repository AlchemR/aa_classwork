import { connect } from 'react-redux'
import todo_list from './todo_list'
import alltoDos from '../../reducers/selectors'
import { receiveToDo, receiveToDos, removeToDo } from '../../actions/todos_actions'

const mapStateToProps = (state) => {
  return {
    todos: alltoDos(state)
}}

const mapDispatchToProps = (dispatch) => {
    return {
        receiveTodo: todo => dispatch(receiveToDo(todo)),
        receiveTodos: todo => dispatch(receiveToDos(todo)),
        removeToDo: todo => dispatch(removeToDo(todo))
    }
}

export default connect(mapStateToProps, mapDispatchToProps)(todo_list)
