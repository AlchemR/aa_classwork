require "byebug"
class Passenger

    attr_reader :name

    def initialize(name)
    @name = name
    @flight_numbers = []
    end

    def has_flight?(string)
    if @flight_numbers.include?(string.upcase) ==  true
        return true
    else
        return false
    end
    end

    def add_flight(str)
# hastrue = self.has_flight?(string)
        if has_flight?(str) == true
            return true
        else
            @flight_numbers << str.upcase
        end
        

    end




end#lastend