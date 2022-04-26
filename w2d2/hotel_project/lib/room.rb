require "byebug"
class Room
  attr_reader :capacity , :occupants
#   def Room(num)
#     @capacity = num
#   end

    def initialize(cap)
    @capacity = cap.to_i
    @occupants = []
    end

    def full?
        if @occupants.length < @capacity
            return false
        elsif @occupants.length >= @capacity
            return true
        end
    end

    def available_space
        space = @capacity - @occupants.length
    return space
    end

def add_occupant(person)
   if self.full? == true
    return false
   else
        @occupants << person
        return true
     end


end


end#lastend

