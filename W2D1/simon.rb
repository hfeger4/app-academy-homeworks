class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
      system("clear")
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if game_over == false
      round_success_message
      sleep 0.50
      @sequence_length += 1
    end

  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep 0.75
      system("clear")
      sleep 0.75
    end
  end

  def require_sequence
    puts "Repeat the sequence by typing the first letter of each color on a new line."
    @seq.each do |color|
      user_color = gets.chomp
      if color[0] != user_color
        @game_over = true
      break
      end
    end
    sleep 0.25
  end

  def add_random_color
    @seq << COLORS.shuffle.first
  end

  def round_success_message
    puts "CORRECT! NEXT ROUND!"
  end

  def game_over_message
    puts "You lost. You made it through #{@sequence_length-1} rounds."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

testing = Simon.new
testing.play
