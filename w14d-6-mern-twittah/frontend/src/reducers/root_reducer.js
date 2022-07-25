// src/reducers/root_reducer.js

import { combineReducers } from 'redux';
import session from './session_reducer';
import errors from "./errors_reducer"
// import tweets from "./"

const RootReducer = combineReducers({
   errors,
   session

});

export default RootReducer;