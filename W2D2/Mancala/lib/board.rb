class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14){Array.new}
    place_stones
  end

  def place_stones
    @cups.each do |cup|
      4.times do
        cup << :stone
      end
    end
    @cups[6] = []
    @cups[13] = []
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if start_pos > 12 || start_pos < 0
    raise 'Invalid starting cup' if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    if current_player_name == @name1
      i = 0
      until @cups[start_pos].length <= 0
        i += 1 if start_pos+i == 13
        @cups[(start_pos+i) % @cups.length] << @cups[start_pos].pop
        i += 1
      end
    end
    render
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?

  end

  def winner
  end
end

a = Board.new("a","b")
p a
