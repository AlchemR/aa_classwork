require "byebug"
class Game
attr_reader :sticks
  def initialize #(n discs)
  @sticks = [[4,3,2,1],[],[]]
  @win = [4,3,2,1]
  end

  def move(start=nil, finish=nil)
  # start=nil
  # finish=nil
   until start != nil && finish != nil
      puts "select a pile to get the disc from"
    start = gets.chomp.to_i

    start -=1
    #to_I?
    raise "start value is not valid"  if start < 0 || start > 3

    puts "select a pile to put the disc into"
    finish = gets.chomp.to_i
    finish -= 1
    raise "end value is not valid"  if finish < 0 || finish > 3

      if @sticks[finish][-1] == nil || @sticks[finish][-1] > @sticks[start][-1]
    move_peice(start,finish)  
      else
        puts "try again, inserting value should be smaller than stack value"
        start = nil
        finish = nil
      end

    end
  end

  def move_peice(start,finish)
    @sticks[finish].push(@sticks[start].pop)
    return @sticks
  end


  def win?
    if @sticks[0].empty? && @sticks[1] && @sticks[-1].length == @win.length
      puts "you win"
    return true
    else 
    return false
    end
  end

def render
    @sticks.each do |ele|
    puts "==============="
      puts ele
    end
  end

def run
  until win? == true
    move
          system('clear')
    render
  end

  end

end



