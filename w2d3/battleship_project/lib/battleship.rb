require_relative "board"
require_relative "player"

class Battleship
attr_reader :board, :player #,

   def initialize(n)
   @player = Player.new
   @board = Board.new(n)
   @size = (n*n)
   @remaining_misses = (@size / 2)
    end

def start_game
@board.place_random_ships
# puts "there are  #{@board.num_ships}  on the board"
puts @board.num_ships
@board.print
end

def lose?
if @remaining_misses <= 0
    puts "you lose"
    # print "you lose"
    return true
else
    return false
end
end

def win?
    if @board.num_ships > 0
        return false
    else
        puts "you win"
       return true
    end

end

def game_over?
if win? == false && lose? == false
return false
else
    return true
end
end

def turn
move = @player.get_move

@board.attack(move)
if @board[move] == :X
    @remaining_misses -= 1
else
end


#probably should use this logic, but didnt get it to work
# if @board.attack(move) == false
#     @remaining_misses -= 1
# end
@board.print
puts @remaining_misses
end


end #lastend