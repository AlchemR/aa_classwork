json.pokemon do
  json.set! @pokemon.id do
    json.extract! @pokemon, :id, :name, :attack, :defense, :poke_type, :image_url
  end
end

poke_moves = @pokemon.moves
json.moves do 
    poke_moves.each do |move|
        json.set! move.id do
            json.extract! move, :id, :name
        end
    end
end

poke_items = @pokemon.items
json.items do
    poke_items.each do |item|
        json.set! item.id do
            json.extract item, :id, :pokemon_id, :name, :price, :happiness, :image_url
        end
    end
end

