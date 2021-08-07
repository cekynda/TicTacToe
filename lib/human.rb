require 'colorize'

class Human < Players
  def initialize(mark)
    @mark = mark
  end

  def turn
    puts
    puts 'введите ячейку 1-9'
    cell = $stdin.gets.chomp.to_i
    if check_cell?(cell) # проверка на ввод в диапозоне от 1-9 и что не пустое значение
      Game.board[cell - 1] = mark.light_green
    else
      puts 'Выберите свободную ячейку'
      turn
    end
  end
end
