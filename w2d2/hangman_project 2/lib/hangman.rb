require "byebug"
class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

def self.random_word
  @word = DICTIONARY.sample
return @word
end

def initialize
  @secret_word = Hangman.random_word
  @guess_word = Array.new(@secret_word.length, "_")
  @attempted_chars = []
  @remaining_incorrect_guesses = 5
  @already_attempted = []
end

def guess_word
  @guess_word
end

def attempted_chars
  @attempted_chars
end

def remaining_incorrect_guesses
  @remaining_incorrect_guesses
end

def already_attempted?(char)
@attempted_chars.include?(char)
end

def get_matching_indices(char)
indexes = []
  @secret_word.each_char.with_index do |letter, idx|
    if letter == char
    indexes << idx
    end
  end
return indexes
end

def fill_indices(char, indexes)
# indexes.map! {|num| @guess_word[num] = char}
  indexes.each do |num|
@guess_word[num] = char
end
return @guess_word
end

def try_guess(char)
  
  if already_attempted?(char) == true
    print "that was already attempted"
    return false
  end
  @attempted_chars << char
indexes = get_matching_indices(char)
  fill_indices(char, indexes)

  if indexes == []
    @remaining_incorrect_guesses -= 1 
  end

return true
end

def ask_user_for_guess
  print "Enter a char:"
guess = gets.chomp
try_guess(guess)
end

def win?
checkarr = []
@secret_word.each_char do |letter|
checkarr << letter
end
  if @guess_word == checkarr
  puts "WIN"
  return true
  elsif @guess_word != checkarr
    return false
  end
end

def lose?
if @remaining_incorrect_guesses == 0
  print "LOSE"
  return true
elsif @remaining_incorrect_guesses != 0
  return false
end
end

def game_over?
  if lose? == false && win? == true
    puts @secret_word
    return true
  elsif lose? == true && win? == false
    puts @secret_word
    return true
  else
    return false
  end


end


end #last end