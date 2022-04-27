require "byebug"
class Player

    def get_move
        puts "enter a position with coordinates separated with a space like `4 7"
    inputmove = gets.chomp
    inputarr = inputmove.split()
    inputarr.map! {|ele| ele.to_i }
    return inputarr
    end
    
    end #lastend

