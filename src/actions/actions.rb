require_relative '../../src/model/state'
module Actions
  def self.move_snake(state)
    next_direction = state.next_direction
    next_position = calc_next_position(state)
    # Check next coord is valid
    if next_coord_is_valid?(state, next_position)
      state = move_snake_to(state, next_position)
    else
      state = end_game(state)
    end
  end

  def self.change_direction(state, direction)
    if next_direction_is_valid?(state,direction)
      state.next_direction = direction
    else
      puts = "invalid direction"
    end
    state
  end

  private
  def self.calc_next_position(state)
    current_head_position = state.snake.positions.first
    new_position = nil
    case state.next_direction
    when Model::Direction::UP
      #Decrease Row
      new_position = Model::Coord.new(
          current_head_position.row - 1,
          current_head_position.col
      )
    when Model::Direction::RIGHT
      #increase col
      new_position = Model::Coord.new(
          current_head_position.row ,
          current_head_position.col + 1
      )
    when Model::Direction::DOWN
      #increase row
      new_position = Model::Coord.new(
          current_head_position.row + 1,
          current_head_position.col
      )
    when Model::Direction::LEFT
      #decrease col
      new_position = Model::Coord.new(
          current_head_position.row ,
          current_head_position.col - 1
      )
    end
    new_position
  end

  def self.next_coord_is_valid?(state, position)

    is_invalid = (position.row > state.grid.rows || position.row <0) || (position.col > state.grid.cols || position.col <0)
    return false if is_invalid

    return !(state.snake.positions.include? position)

  end

  def self.next_direction_is_valid?(state, direction)
    case state.next_direction
    when Model::Direction::UP
      return true if direction != Model::Direction::DOWN
    when Model::Direction::DOWN
      return true if direction != Model::Direction::UP
    when Model::Direction::RIGHT
      return true if direction != Model::Direction::LEFT
    when Model::Direction::LEFT
      return true if direction != Model::Direction::RIGHT
    end
    false
  end

  def self.move_snake_to(state, next_position)
    snake = state.snake
    new_positions = [next_position] + snake.positions[0...-1]
    state.snake.positions = new_positions
    state
  end

  def self.end_game(state)
    state.game_finished = true
    state
  end
end
