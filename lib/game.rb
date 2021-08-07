require 'pry'
require 'colorize'
class Game
  attr_accessor :players, :mark
  @@board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  @@win_possitions = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  def self.board=(board)
    @@board = board
  end

  def self.board
    @@board
  end

  def initialize
    @players = []
    
  end

  def display_field
    puts "#{@@board[0]} | #{@@board[1]} | #{@@board[2]}"
    puts '---------'
    puts "#{@@board[3]} | #{@@board[4]} | #{@@board[5]}"
    puts '---------'
    puts "#{@@board[6]} | #{@@board[7]} | #{@@board[8]}"
    puts
  end

  def clear
    system('clear')
  end

  def check_first_turn
    clear
    puts 'Чем будете играть? 1 - Х, 2 - О'  
    input = $stdin.gets.chomp.to_i
    if input == 1
      clear
      @players << Bot.new('O')
      @players << Human.new('X')
    else
      clear
      display_field
      @players << Human.new('O')
      @players << Bot.new('X')
    end
  end

  def position_taken?(input)
    if @@board[input] == "X".light_green || @@board[input] == "O".light_blue
      true
    elsif @@board[input] == "X".light_blue || @@board[input] == "O".light_green
      true
    end
  end

  def won?
    @@win_possitions.detect do |combo|
      @@board[combo[0]] == @@board[combo[1]] && @@board[combo[1]] == @@board[combo[2]] && position_taken?(combo[0])
    end
  end

  def winner
    won = nil
    if winner = won?
      won = @@board[winner.first]
    end
  end

  def start
    check_first_turn
    loop do
      @players.each do |player|
          player.turn
          clear
          display_field
          if won?
            winner = winner()
            puts "Победил игрок: ".green + "#{winner}".yellow
            exit
          end
          if !@@board.include?(' ')
            puts 'Ничья'.red
            exit
          end
      end
    end
  end
end