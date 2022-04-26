class GuessingGame

# attr_reader :num_attempts 

def initialize(min, max)
    # @min.to_i = mini
    # @max.to_i = maxi
    
    # @min.to_i = gets.chomp
    # @max.to_i = gets.chomp

    @secret_num = rand(@min.to_i..@max.to_i)
    @num_attempts = 0
    @game_over = false
end

def num_attempts
@num_attempts
end

def game_over?
@game_over
end


def check_num (numb)
numb = numb.to_i
    if numb == @secret_num
        puts "game over, you win"
        @game_over = true

    elsif numb != @secret_num && @secret_num < numb
    puts "too big"
    @num_attempts += 1
    elsif numb != @secret_num && @secret_num > numb
        puts "too small"
        @num_attempts += 1
    end
end

def ask_user
    print "enter a number"
    input = gets
    num_input = input.chomp
    num_input.to_i
    check_num(num_input.to_i)
end




end #last end