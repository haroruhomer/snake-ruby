require 'minitest/autorun'
require_relative '../src/model/state'
require_relative '../src/actions/actions'
class ActionsTest < Minitest::Test
  def test_move_snake
    initial_state = Model::State.new(
        Model::Snake.new([
                             Model::Coord.new(1,1),
                             Model::Coord.new(0,1)
                         ]),
        Model::Food.new(3,3),
        Model::Grid.new(10,10),
        Model::Direction::DOWN,
        false #game_finished
    )
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

    new_state = Actions::move_snake(initial_state)
    assert_equal(expected_state,new_state)
  end
end