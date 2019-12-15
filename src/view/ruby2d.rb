require 'ruby2d'
module View
  class Ruby2dView
    def initialize
      @pixel_size = 20
    end
    def render(state)
      extend Ruby2D::DSL
      set title: "Hello",
          width: state.grid.cols * @pixel_size,
          height: state.grid.rows * @pixel_size
      render_food(state)
      render_snake(state)
      show
    end

    private
    def render_food(state)
      extend Ruby2D::DSL
      food = state.food
      Square.new(
          x: food.col * @pixel_size,
          y: food.row * @pixel_size,
          size: @pixel_size,
          color: 'red'
          )
    end

    def render_snake(state)
      extend Ruby2D::DSL
      snake = state.snake
      snake.positions.each do |pos|
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

