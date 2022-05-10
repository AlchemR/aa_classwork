require_relative "./node.rb"
require "byebug"

class Knight

    POSSIBLE_MOVES = [[1,2],[-1,2],[1,-2],[-1,-2],[2,1],[-2,1],[2,-1],[-2,-1]]

    attr_reader :startpos, :considered_moves
  def initialize(start_position)
    @start_position = start_position #[2,1]
    @considered_moves = [@start_position] # [0,0], [1,2], [2,1], [2,4], [3,3]
    # @valid_moves = @start_position.valid_moves 
  end

  def new_move_pos(pos) #[1,2]

    newmoves = Knight.valid_moves(pos).select{ |ele| !@considered_moves.include?(ele)}
    @considered_moves += newmoves 
    return @considered_moves

  end
 

  def self.valid_moves(position) 
    prc = Proc.new {|a,b| a >= 0 && a <= 7 && b >= 0 && b <= 7} #grid size 0,7 is 8x8
    potentialmove = []
 
    POSSIBLE_MOVES.each do |pos|  # s is for starter p is for possible
      startpos = position
      temp = [startpos[0] + pos[0], startpos[1] + pos[1]]
        row = temp[0]
        col = temp[1]
      if prc.call(row, col) # == true
        potentialmove << temp
      end
    end
    potentialmove
  end

  def build_move_tree
    queue = []
    queue += new_move_pos(@start_position)
    i = 0
    while queue.count < 64
      temp1 = new_move_pos(queue[i])
      if temp1.count > 0
        temp1.each do |ele|
          if considered_moves.include?(ele) == false
            queue += ele
          end
        end
      end
      i += 1

    end

  end



end

#8x8 gid
#possible positions
#vaid positions (filter)
#make into child pairs?



