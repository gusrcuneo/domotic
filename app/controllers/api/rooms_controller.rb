class Api::RoomsController < Api::ApiController

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find params[:id]
  end

end
