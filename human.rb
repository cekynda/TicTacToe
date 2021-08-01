class Human < Players

  def initialize(mark)
    @mark = mark
  end
  
  def turn(board, players, input)
    puts
    puts "введите ячейку 1-9"
    cell = $stdin.gets.chomp.to_i
    if check_cell?(cell) # проверка на ввод в диапозоне от 1-9 и что не пустое значение
      turn(board,players)
    else
      if (board[cell - 1] == ' ')
        if input == 1
          board[cell - 1] = 'X'
        else
          board[cell - 1] = 'O'
        end
      else
        puts 'Выберите свободную ячейку'
        turn(board, players)
      end
    end
  end
end