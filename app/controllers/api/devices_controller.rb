class Api::DevicesController < Api::ApiController
  def index
    @room = Room.find params[:room_id]
    @devices = @room.devices
  end

end
