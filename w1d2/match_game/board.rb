require 'byebug'
require_relative 'card'

class Board
  ALPHABET = ('a'..'z').to_a
  BOARD_SIZE = 30

  attr_reader :user_board

  def self.default
    Array.new(6) {Array.new(5)}
  end

  def cards
    all_cards = ALPHABET.slice(0, BOARD_SIZE/2)
    cards_double = all_cards.dup
    all_cards += cards_double
  end

  def initialize(board = Board.default)
    @user_board = board
    @cards = cards
    populate
    #@answer_board
  end

  def [](row, col)
    @user_board[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @user_board[row][col] = val
  end

  def populate
    @user_board.each_with_index do |row, row_idx|
      row.each_with_index do |el, col_idx|
        current_card = @cards.sample
        self[[row_idx, col_idx]] = Card.new(current_card)
        #self[[row_idx, col_idx]] = Card.new('k')
        @cards.delete_at(@cards.index(current_card))
      end
    end
  end

  def display
    header = (0..4).to_a.join(" ")
    puts "  #{header}"
    row_display
  end

  def row_display
    @user_board.each_with_index do |row, row_num|
      puts "#{row_num} #{row.join(" ")}"
    end
  end




end #class end
