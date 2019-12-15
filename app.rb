require_relative 'src/view/ruby2d'
require_relative 'src/model/state'
require_relative 'src/actions/actions'

class App
  def initialize
    @view = View::Ruby2dView.new
    @state = Model::initial_state
  end

  def start
    Thread.new {init_timer}
    @view.start(@state)
  end
  def init_timer
    loop do
      @state = Actions::move_snake(@state)
      @view.render(@state)
      #Trigger Move Snake Action
      sleep 0.5
    end
  end
end
app = App.new
app.start