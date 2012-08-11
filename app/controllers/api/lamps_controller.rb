class Api::LampsController < Api::ApiController
  def index
    @room = Room.find params[:room_id]
    @lamps = @room.lamps
  end

  def show
    @room = Room.find params[:room_id]
    @device = @room.devices.find params[:id]
  end

end
