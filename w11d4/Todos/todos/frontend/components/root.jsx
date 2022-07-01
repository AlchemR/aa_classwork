import React from "react";
import  {Provider} from 'react-redux';
import {App} from './app'
import alltoDos from "../reducers/selectors";

const Root = ({store}) => {
return(
    <Provider store={store}>
        <App />
    </Provider>
)}

export default Root;

