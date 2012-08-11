class Api::DevicesController < Api::ApiController
  def index
    @room = Room.find params[:room_id]
    @devices = @room.devices
  end

  def show
    @room = Room.find params[:room_id]
    @device = @room.devices.find params[:id]
  end

end
