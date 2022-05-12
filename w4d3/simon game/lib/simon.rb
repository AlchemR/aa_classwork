class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq


  def initialize
    @sequence_length = 1
    @game_over = false
    @sequence = []
  end

  def play
    until @game_over == true
      self.take_turn
      system('clear') 
    end

    self.game_over
    self.reset
  end

  def take_turn
    self.show_sequence 
    sleep(3)
    system('clear')
    self.require_sequence 

    unless @game_over
      self.round_success_message 
      @sequence_length += 1
    end
  end

  def show_sequence
    p 'Watch the sequence or be doomed'
    p self.add_random_color
  end

  def require_sequence
    p "Type in each color then press Enter"

    @sequence.each do |color| 
      user_guess = gets.chomp 
      @game_over = true if user_guess != color 
    end
  end

  def add_random_color
    @sequence << COLORS.rand
  end

  def round_success_message
    p "good job"
  end

  def game_over
    p "Try again with more allocated memory"
  end

  def reset
    @sequence_length = 1
    @game_over = false 
    @sequence = []
  end

end


