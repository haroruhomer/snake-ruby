require 'ruby2d'
module View
  class Ruby2dView
    def initialize(app)
      @pixel_size = 30
      @app = app
    end
    def start(state)
      extend Ruby2D::DSL
      set title: "Hello",
          width: state.grid.cols * @pixel_size,
          height: state.grid.rows * @pixel_size

      on :key_down do |event|
        handle_key_event(event)
      end
      show
    end
    def render(state)
      extend Ruby2D::DSL
      close if state.game_finished
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
          color: 'red'
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

    def handle_key_event(event)
      case event.key
      when "up"
        @app.send_action(:change_direction,Model::Direction::UP)
      when "down"
        @app.send_action(:change_direction,Model::Direction::DOWN)
      when "left"
        @app.send_action(:change_direction,Model::Direction::LEFT)
      when "right"
        @app.send_action(:change_direction,Model::Direction::RIGHT)
      end
    end

  end
end

