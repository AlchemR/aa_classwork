import ReactDOM from 'react-dom';
import React from 'react';
import * as APIUtil from './util/api_util';
import * as pokemonActions from './actions/pokemon_actions';
import configureStore from './store/store'
import * as selectors from './reducers/selectors';

document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById('root');
    const store = configureStore();
    window.fetchAllPokemon = APIUtil.fetchAllPokemon;
    window.receiveAllPokemon = pokemonActions.receiveAllPokemon;
    window.requestAllPokemon = pokemonActions.requestAllPokemon;
    window.selectAllPokemon = selectors.selectAllPokemon;
    window.getState = store.getState; 
    window.dispatch = store.dispatch;



    ReactDOM.render(<h1>Pokedex</h1>, root);
    
});