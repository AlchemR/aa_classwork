require "flight"
require "passenger"
require "byebug"

class Flight

def initialize(flightnum, capacity)
    @flight_number = flightnum
    @capacity = capacity
    @passengers = []
end

def passengers
    @passengers
end

def full?
    if @passengers.length >= @capacity
        return true
    else 
        return false
    end
end

def board_passenger(passenger)

    if passenger.has_flight?(@flight_number) == true
    if full? == false        
        @passengers << passenger
    end
    end
end

def list_passengers
listpass = []
passengers.each {|ele| listpass << ele.name }
return listpass
end

def [] (num)
    listpass1 = []
    passengers.each {|ele| listpass1 << ele }
return listpass1[num]
end

def << (passenger)
board_passenger(passenger)
end




end#lastend