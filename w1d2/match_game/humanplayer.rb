class HumanPlayer

  def initialize
  end

  def get_first_pos
    puts "Which position do you want to reveal first? (row, col)"
    first_pos = gets.chomp
    first_pos
  end

  def get_second_pos
    puts "Which position do you want to reveal next? (row, col)"
    second_pos = gets.chomp
    second_pos
  end

end #class end
