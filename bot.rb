class Bot < Players
  def initialize(mark)
    @mark = mark
  end

  def turn
    cell = rand(1..9)
    if check_cell?(cell)
      Game.board[cell - 1] = mark
      Game.bot_turn.push(cell - 1)
    else
      turn
    end
  end
end
