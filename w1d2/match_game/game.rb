require_relative 'board'
require_relative 'card'
require_relative 'humanplayer'
require_relative 'computerplayer'
require "byebug"

class Game
  def initialize(*player_type)
    @board = Board.new

    if player_type == "yes" || player_type.nil?
      @player = HumanPlayer.new
    else @player = ComputerPlayer.new
    end

    play
  end

  def play
    puts "Here is your board!"
    @board.display
      until win?
        first_guess_card
        @board.display
        second_guess_card
        @board.display
          if correct_guess?
            puts "Nice! Guess again!"
          else puts "Nope!"
            @board.display
          end
      end

    puts "you win!"
    @board.display
  end

  def first_guess_card
    @first_pos = @player.get_first_pos.split(", ").map(&:to_i)
    @first_guess = @board[@first_pos[0], @first_pos[1]]
    @board[@first_pos[0], @first_pos[1]].reveal
  end

  def second_guess_card
    @second_pos = @player.get_second_pos.split(", ").map(&:to_i)
    @second_guess = @board[@second_pos[0], @second_pos[1]]
    @board[@second_pos[0], @second_pos[1]].reveal
  end

  def correct_guess?
    if @first_guess.==(@second_guess)
      true
    else
      @board[@first_pos[0], @first_pos[1]].flip_back
      @board[@second_pos[0], @second_pos[1]].flip_back
      false
    end
  end

  def win?
    @board.user_board.flatten.none? { |card| card.hide }
  end

end #class end

if __FILE__ == $PROGRAM_NAME
  puts "Are you human? Type yes or no."
  player_type = gets.chomp
  Game.new(player_type)
end
