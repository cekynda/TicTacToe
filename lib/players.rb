class Players
  attr_accessor :mark

  def check_cell?(cell)
    cell >= 1 && cell <= 9 && Game.board[cell - 1] == ' '
  end
end
