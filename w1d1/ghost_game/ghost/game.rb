class Game

  def initialize
    @player_1 = "Player 1"
    @player_2 = "Player 2"
    @win = nil
    @current_player = @player_1
    @previous_player = nil
    @accuse = false
    @record = {player_1: 0, player_2: 0}
    @fragment = []
    @dictionary = File.new("./ghost_dictionary.txt").readlines.map { |el| el.chomp }
  end

  def valid_move?(string)
    temp = @fragment.dup
    temp << string
    temp = temp.join("")
    result = false
    @dictionary.each do |word|
      i = 0
      temp.length.times do
        if temp.split("")[i] == word.split("")[i]
          i += 1
          result = true
        else
          result = false
        end
      end
      return true if result == true
    end
    result
  end

  def next_player!
    if @current_player == @player_1
      @current_player = @player_2
      @previous_player = @player_1
    else @current_player = @player_1
      @previous_player = @player_2
    end
  end

  def last_move
    if valid_move?(@current_move)
      @win = @current_player
    else @win = @previous_player
    end
  end

  def get_move
    puts "#{@current_player} add a letter!"
    @current_move = gets.chomp
    if @current_move.downcase == "accuse"
      @accuse = true
      puts "#{@previous_player} youve been accused of not having anymore letters!"
      last_move
    elsif valid_move?(@current_move)
      @fragment << @current_move
    else
      puts ("Mmmmm thats not a word. Sorry #{@current_player}, you lose.")
      @win = @previous_player
    end
  end

  def play_round
    while @win.nil?
      get_move
      next_player!
    end
    record
    puts "#{@win} youve won!"
    scoreboard
    game_over?
  end

  def record
    if @win == @player_1
    @record[:player_2] += 1
    else @record[:player_1] += 1
    end
  end

  def scoreboard
    ghost = "GHOST"
    player_1_letters = ghost[0..@record[:player_1]] unless @record[:player_1] == 0
    player_2_letters = ghost[0..@record[:player_2]] unless @record[:player_2] == 0
    puts "Player 1 has #{player_1_letters}. Player 2 has #{player_2_letters}."
  end

  def game_over?
    @record.each do |player|
      if @record[player] > 3
        puts "#{@win} won the whole game!"
      end
    end
  end



end #class end
