require "byebug"
require_relative('./game.rb')

class Board
   attr_reader :grid

   def initialize
        # @grid = Array.new(3, "_") {Array.new(3, "_")}
        @grid = Array.new(3) {Array.new(3, "_")}
        @size = @grid[0].length * @grid.length
        # @validsize = ( @grid[0].length -1 )
        @player1 = "X"
        @player2 = "O"
    end

    # def[](pos)
    # row,col = pos
    # @grid[row][col]
    # end

    
# load 'board.rb'
# b = Board.new
# b.valid?(99)


def valid?(pos)
        pos = pos.to_s
        row = pos[0].to_i
        col = pos[1].to_i
        validcord = []
        @grid.each_with_index do |ele1, idx1|
        ele1.each_with_index do |ele2, idx2|
        validcord << "#{idx1}#{idx2}"
        end
        end
      if validcord.include?(pos) == true
        return true
      else 
        puts "invalid location"
        return false
      end

    end

#    if row > 0 && col > 0
#     if @grid[row][col] == nil
#         return false
#     else 
#         return true
#     end
# end
# end

#     #define if position entered is valid, within (0, 1, 2) of array positions
#    size1 =  @grid[0].length - 1
# rowvalid = false
# colvalid = false
# if (0 <= row == true && row <= size1)
#         rowvalid = true
#      end

#     if 0 <= col == true && col <= size1
#     colvalid = true
#     end
#     #     rowvalid = true if 0 < row == true && row < size1
#     # colvalid = true if 0 < col == true && col < size1
#         if rowvalid && colvalid == true
#             return true
#         end
    # end


    def empty?(pos)
        pos = pos.to_s
        row = pos[0].to_i
        col = pos[1].to_i
        if valid?(pos) == true && @grid[row][col] == "_" 
        return true    
         else 
           puts "Not empty"
        return false 
        end
    end


    def place_mark(mark1)
        puts "====  #{mark1} ==== your move"
        pos = gets.chomp
        mark = mark1
        p0 = pos[0].to_i
        p1 = pos[1].to_i
        if empty?(pos) == true &&  valid?(pos) == true
        @grid[p0][p1] = mark
        else
            "cannot place there"
        end
    end

def print
    @grid.each_with_index do |row, idx|
        puts"    | " + row.join(" | ") + " |  "
        puts "                             "
    end
end

# def win_row?
#     @grid.each_with_index do |row|
#         if row.all? {|ele| ele == @player1 } == true
#         puts "X wins"
#         return true
#         elsif row.all? {|ele| ele == @player2 } == true
#         puts "O wins"
#         return true
#         end
#     end

# end


def win_row?
@grid.each_with_index do |row, idx1|
temp = []
row.each_with_index {|ele, idx2| temp << @grid[idx1][idx2]}

    if temp.all? {|ele| ele == @player1}
        puts @player1+ " wins"
        return true    
    elsif temp.all? {|ele| ele == @player2}
        puts @player2 + " wins"
        return true        
    end
end
return false
end


def win_col?
@grid.each_with_index do |row, idx1|
temp = []

    row.each_with_index do |ele, idx2|
    temp << @grid[idx2][idx1]
    end

    if temp.all? {|ele| ele == @player1}
        puts @player1 + " wins"
        return true    
    elsif temp.all? {|ele| ele == @player2}
        puts @player2 + " wins"
        return true        
    end
end
return false
end

def win_diag?
#diagonal 1
temp = []
temp1 = []
grid2 = []
    @grid.each_with_index do |row, idx1| 
        temp << @grid[idx1][idx1]
        grid2 << row.reverse
    end

    grid2.each_with_index {|row2, idx2| temp1 << grid2[idx2][idx2]}

    if temp.all? {|ele2| ele2 == @player1} || temp1.all? {|ele4| ele4 == @player1}
    puts  @player1 + "  wins"
    return true
    elsif temp.all? {|ele1| ele1 == @player2} || temp1.all? {|ele3| ele3 == @player2}
    puts @player1 + "  wins"
    return true
    end
return false
end

def win?
    if win_row == true || win_col == true || win_diag == true
        return true
    else 
        return false
    end

end

def empty_positions?
    grid2chex = @grid.flatten.any?("_")
end

end #lastend