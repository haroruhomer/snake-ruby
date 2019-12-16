require 'ruby2d'
module View
  class Ruby2dView
    def initialize
      @pixel_size = 30
    end
    def start(state)
      extend Ruby2D::DSL
      set title: "Hello",
          width: state.grid.cols * @pixel_size,
          height: state.grid.rows * @pixel_size
      show
    end
    def render(state)
      render_snake(state)
      render_food(state)
    end

    private
    def render_food(state)
      extend Ruby2D::DSL
      food = state.food
      @food.remove if @food
      @food = Square.new(
          x: food.col * @pixel_size,
          y: food.row * @pixel_size,
          size: @pixel_size,
          color: 'random'
          )
      state
    end

    def render_snake(state)
      @snake_positions.each(&:remove) if @snake_positions
      extend Ruby2D::DSL
      snake = state.snake
      @snake_positions = snake.positions.map do |pos|
        Square.new(
            x: pos.col * @pixel_size,
            y: pos.row * @pixel_size,
            size: @pixel_size,
            color: 'green'
        )
      end
    end
  end
end

