

class TicTacToe

  WIN_COMBINATIONS = [
[0,1,2], # top_row
[3,4,5], # middle_row
[6,7,8], # bottom_row
[0,3,6], # left_column
[1,4,7], # center_column
[2,5,8], # right_column
[0,4,8], # left_diagonal
[6,4,2] # right_diagonal
]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def input_to_index(position)
    input=position.to_i
    input-1
  end

  def move (index, token = 'X')
    @board[index] = token
  end

  def position_taken?(position)
    if @board[position] == 'X' || @board[position] == 'O'
      true
    else
      false
    end
  end

  def valid_move?(position)
    if @board[position] == ' '
      true
    elsif position >=0 && position <=8
      true
    else
      false
    end
  end

  def turn
    puts "Hello! Please make your move (1-9)" #ask for input
    move = gets.chomp #get input
    index = input_to_index(move) #translate input into index
    if valid_move?(index) #if index is valid
      token = current_player
      move(index, token) #  make the move for index
      display_board #  show the board
    else
      puts "Hello! Please make your move (1-9)" #ask for input
    end
  end
end
