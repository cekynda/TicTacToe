class Human < Players

  def initialize(mark)
    @mark = mark
  end
  
  def turn
    @players.each do |player|
      if player.mark == 'X'
        puts "X выбирает клетку"
      else
        puts "O выбирает клетку"
      end
    end
    puts "введите ячейку 1-9"
    cell = $stdin.gets.chomp.to_i
    if (@board[cell - 1] == ' ')
      @board[cell - 1] = 'X' # придумать как сюда вносить динамически марку
    else
      puts 'Выберите свободную ячейку'
      turn
    end
  end
end