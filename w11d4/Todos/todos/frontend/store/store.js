import { legacy_createStore as createStore} from 'redux'
import { applyMiddleware } from 'redux'
import rootReducer from "../reducers/root_reducer"
import myThunk from '../middleware/thunk'
import { fetchTodos } from '../actions/todos_actions'


const configureStore = (preloadedState = {}) => {

  // return createStore(rootReducer, preloadedState)
  return createStore(rootReducer, preloadedState, applyMiddleware(myThunk))
}


export default configureStore;


//why do the above as opposed to
// createStore(rootReducer, preloadedState = {})