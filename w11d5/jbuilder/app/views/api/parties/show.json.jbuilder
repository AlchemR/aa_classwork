json.extract! @party, :guests

json.guest_gifts do
    @party.guests.each do |guest|
        json.name guest.name
        gifts = guest.gifts
        gifts.each do |gift|
            json.gift gift.title
        end 
    end 
end

