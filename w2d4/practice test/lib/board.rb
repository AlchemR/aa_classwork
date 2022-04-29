require "byebug"
class Board
attr_reader :max_height

    def self.build_stacks(n)
        @stacinput = n
        @stac = Array.new(n) {Array.new(0)}
        return @stac
    end    


    def initialize(sta, maxheight)
        @stacks = Board.build_stacks(sta)  # class methods call (classname).(method name)
        @max_height = maxheight

        if (maxheight < 4) == true || (maxheight == 4) == true ||  (sta == 4) == true || (sta < 4) == true 
            raise "rows and cols must be >= 4" end


    end


    def add(token, si) #si short for stackindex
       if @stacks[si].length < @max_height == true
        @stacks[si] << token
        return true
       elsif @stacks[si].length == @max_height 
        return false
       end
    end

    def vertical_winner?(token)
    @stacks.each do |row|
    
       if row.count(token) == max_height 
        return true
       end
    end
            return false
    end

    def horizontal_winner?(token)
    #made grid 
        horistacks = []
    @stacks.each_with_index do |row1, idx1|
    temparr = []
        @stacks.each_with_index do |row2, idx2|
        temparr << @stacks[idx2][idx1]
        end
    horistacks << temparr 
    end
    
            horistacks.each do |row|
                if row.count(token) == @stacks.length
                    return true
                end
            end
            
            return false

    end

    def winner?(token)
        if horizontal_winner?(token) == true || vertical_winner?(token) == true
            return true
        else          
            return false
      end
    end
    

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end
end
