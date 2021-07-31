class Players 
  attr_accessor :mark

  def check_cell(cell)
    if cell < 1 || cell > 9 || (cell.zero? && cell.empty?)
      puts 'Введите значение от 1-9'
      turn
    end
  end
end
