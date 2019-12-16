require 'minitest/autorun'
require_relative '../src/model/state'
require_relative '../src/actions/actions'
class ActionsTest < Minitest::Test
  def setup
    @initial_state = Model::State.new(
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
  def test_move_snake

    expected_state = Model::State.new(
      Model::Snake.new([
                           Model::Coord.new(2,1),
                           Model::Coord.new(1,1)
                       ]),
      Model::Food.new(3,3),
      Model::Grid.new(10,10),
      Model::Direction::DOWN,
      false #game_finished
    )

    new_state = Actions::move_snake(@initial_state)
    assert_equal(expected_state,new_state)
  end

  def test_invalid_change_direction
    expected_state = @initial_state
    new_state = Actions::change_direction(@initial_state,Model::Direction::UP)
    assert_equal(new_state, expected_state)
    end
  def test_valid_change_direction
    expected_state = @initial_state
    expected_state.next_direction = Model::Direction::LEFT
    new_state = Actions::change_direction(@initial_state,Model::Direction::LEFT)
    assert_equal(new_state, expected_state)
  end
end