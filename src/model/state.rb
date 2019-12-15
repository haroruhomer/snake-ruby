module Model
  module Direction
    UP = :up
    RIGHT = :right
    LEFT  = :left
    DOWN = :down
  end
  class Coord < Struct.new(:row,:col)
  end
  class Food < Coord

  end
  class Snake < Struct.new(:positions)

  end

  class Grid < Struct.new(:rows,:cols)

  end

  class State < Struct.new(:snake, :food, :grid, :next_direction, :game_finished)

  end

  def self.initial_state
    state = Model::State.new(
        Model::Snake.new([
                             Model::Coord.new(1,1),
                             Model::Coord.new(0,1)
                         ]),
        Model::Food.new(3,3),
        Model::Grid.new(10,10),
        Model::Direction::DOWN,
        false #game_finished
    )

  end

end