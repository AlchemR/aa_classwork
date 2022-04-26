require_relative "room"
require "byebug"

class Hotel
def initialize(name, hashroom)
@name = name
@rooms = {}
hashroom.each do |k,v| 
    @rooms[k] = Room.new(v)
end
end

def name
namearr = @name.split(" ")      
namearr.each {|ele| ele[0] = ele[0].upcase}
return namearr.join(" ")
end

def rooms
@rooms
end

def room_exists?(roomname)
@rooms.has_key?(roomname)
end

def check_in(person, roomname)
    if room_exists?(roomname) == false
        print 'sorry, room does not exist'
    elsif room_exists?(roomname) == true
     if @rooms[roomname].add_occupant(person) == true
        puts 'check in successful' 
     else 
        puts 'sorry, room is full'
    end
    end 
end

def has_vacancy?
# debugger
   count = @rooms.values
count.each do |roomname|
    if roomname.full? == false
        return true
    end
end
return false
end

def list_rooms
@rooms.each do |k,v|
puts "#{k}  #{@rooms[k].available_space}"
end
end

end #last end