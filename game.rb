class Game
  attr_accessor :players, :board, :mark

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

  def initialize
    @players = []
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def display_field
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts '---------'
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts '---------'
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
    puts
  end
  
  def check_first_turn(input)
    if input == 1
      @players << Bot.new('O')
      @players << Human.new('X')
    else
      @players << Human.new('O')
      @players << Bot.new('X')
    end
    @players
  end

  def start
    puts 'Чем будете играть? 1 - Х, 2 - О'
    input = $stdin.gets.chomp.to_i
    check_first_turn(input)
    turns = 1
    while turns < 10
      @players.each do |player|
        player.turn(@board, @players, input)
        display_field
      end
      if win?
        break
      end
      turns += 1
    end
    puts 'Ничья'
  end

  def win?  # придумать реализацию проверки победы, данные вариант не работает. Или разобраться почему не работает
   
    # @@win_possitions.each do |win|
    #   result = win.map { |index| @board[index] }
    #   case result.join
    #   when 'OOO'
    #     if @players[0].mark == 'O'
    #       puts 'Player1 won'
    #     else
    #       puts 'Player2 won'
    #     end
    #   when 'XXX'
    #     if @players[0].mark == 'X'
    #       puts 'Player1 won'
    #     else
    #       puts 'Player2 won'
    #     end
    #   end
      return false
  end
end

