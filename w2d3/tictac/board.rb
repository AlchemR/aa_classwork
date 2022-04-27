class Board
   
    def initialize
        @grid = Array.new(3, "_") {Array.new(3, "_")}
        # @grid = Array.new(3) {Array.new(3, "_")}
    end

    def[](pos)
    row,col = pos
    @grid[row][col]
    end


    def valid?(pos)
    row, col = pos
    #define if position entered is valid, within (0, 1, 2) of array positions
   size = @grid[0].length -1
   pos.each do |ele|
     true if (ele < size && ele > 0) 
#  vs if (ele < size && ele > 0) then return true else end
    end
    end


    def empty?(pos)
     row, col = pos
    if valid(pos) == true? && @grid[row][col] == "_"
        return true
    else 
        return false
    end
    end

    def place_mark(pos,mark)

    end



    
end