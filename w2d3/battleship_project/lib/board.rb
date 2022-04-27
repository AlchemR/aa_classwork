require "byebug"
class Board

  attr_reader :size

    def initialize(num)
        # @grid = Array.new(num).map{|row| Array.new(num,:N)}
        @grid = Array.new(num) { Array.new(num, :N) }
        @size = (num * num)
    end

def [](pos)
row, col = pos
@grid[row][col]
end

def []=(pos, val)
row, col = pos
@grid[row][col] = val
end

def num_ships
sym = :S
count = 0
@grid.each do |row|
row.each do |ele|   
    if ele == sym
        count +=1
    end
end
end
return count
end

def attack(pos)
    if self[pos] == :S
         self[pos]= :H
        puts "you sunk my battleship!"
         return true
    else
        self[pos] = :X
        return false
        end
end

def place_random_ships
    total = @grid.flatten.length
    quarter = (total / 4)
    half = (quarter / 2)
    
    while num_ships < quarter
    @grid.each do |arr|
        if num_ships < quarter
    arr[rand(half),rand(half)] = :S
        else
        end

    end
    end
end

def hidden_ships_grid
hidden = @grid.map {|row| row.map{|letter| if letter == :S then letter = :N else letter end} }
return hidden
end

def self.print_grid(grid)
grid.each do |ele| 
puts ele.join(" ")
end
end

def cheat
Board.print_grid(@grid)
end

def print
    Board.print_grid(hidden_ships_grid)
end

end #lastend