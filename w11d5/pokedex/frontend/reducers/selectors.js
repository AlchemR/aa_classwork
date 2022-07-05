export const selectAllPokemon = (state) => {
    let array = Object.values(state.entities.pokemon);
    return array;
}