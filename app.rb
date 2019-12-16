require_relative 'src/view/ruby2d'
require_relative 'src/model/state'
require_relative 'src/actions/actions'

class App
  def initialize
    @view = View::Ruby2dView.new(self)
    @state = Model::initial_state
  end

  def start
    timer = Thread.new {init_timer}
    @view.start(@state)
    timer.join()
  end
  def init_timer
    loop do
      @state = Actions::move_snake(@state)
      @view.render(@state)
      if @state.game_finished
        break
      end
      #Trigger Move Snake Action
      sleep 0.5
    end
  end
  def send_action(action, params)
    #Call a method with params
    new_state = Actions.send(action, @state, params)
    if new_state.hash != @state.hash
      @state = new_state
      @view.render(@state)
    end
  end
end
app = App.new
app.start