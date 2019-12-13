require_relative 'src/view/ruby2d'
require_relative 'src/model/state'

view = View::Ruby2dView.new
initial_state = Model::initial_state
view.render(initial_state)

class App
  def start

  end
  def init_timer
    loop do
      sleep 0.5
      #Trigger Move Snake Action
    end
  end
end

