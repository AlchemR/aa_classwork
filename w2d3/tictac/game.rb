require_relative "./board.rb"
require_relative "./human.rb"
class Game

        # def initialize(player1, player2)
    def initialize
@player1 = Human.new(:X)
@player2 = Human.new(:O)
@turn_counter = 0
end

def whose_turn
    if @turn_counter % 2 == 0
        return @player1.mark
    else
    return @player2.mark
    end
end


    def switch_turn
    @turn_counter += 1
    if @turn_counter % 2 == 0
        puts " ==  Player 1 ==  #{@player1.mark}"
    else
        puts " ==  Player 2 ==  #{@player2.mark}"
    end    
end

end#lastend

# game1 = Game.new(:X,:O)
# board1 = Board.new
# puts "New game"
#     board1.print
# # while board1.empty_positions? == true
#     board1.place_mark(game1.whose_turn)
#    if board1.win? == true
    #     board1.win_row?
    #     board1.win_col?
    #     board1.win_diag
    #     end
    #     board1.print
    #     game.switch_turn
# # end
# if board1.empty_positions? == false && board1.win? == false
#     puts "draw"
# end