class ComputerPlayer
  def initialize
    @computers_board = Array.new(6) {Array.new(5)
  end

  #this is called in game, need it
  def get_first_pos
    puts "Which position do you want to reveal first? (row, col)"
    computer_guess
  end

  #this is called in game, need it
  def get_second_pos
    puts "Which position do you want to reveal next? (row, col)"
    computer_guess
  end

  def computer_guess
    if nil_guess
      nil_guess
    else
      shed_revealed
      known_guess
    end
  end

  def nil_guess
    @computers_board.each_with_index do |row, row_idx|
      row.each do |el, col_idx|
        if el.empty?
          return "#{row_idx}, #{col_idx}"
        end
      end
      nil
    end

  def shed_revealed







  #computers going to guess a position, and recieve what that value is
  # computer then pushes that value in its own Array
  # computer checks own array for a known match. if match, guess that location.
  # if no match, computer guesses another random, unkown position.
  #computer recieves second value and pushes into own array

  # while theres nils in the array
  # go through every nil (unknown card) first. and keep pushing
  # to own array, and matching if matches.
  # after theres no nils in the array
  #iterate through array, and if card revealed, change to _
  # then, while not all values in array are _
  # iterate through until a letter, and make that position first guess
  #then find match and guess that one. and then turn those two values to _
  #yup!

end #class end
