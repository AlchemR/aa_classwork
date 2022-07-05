# json.guest do 
    # json.extract! @guest, :name, :age, :favorite_color
# end

json.partial! 'guest', guest: @guest

json.gifts do
    gifts = @guest.gifts
    gifts.each do |gift|
    json.title gift.title
    json.description gift.description
    end
end