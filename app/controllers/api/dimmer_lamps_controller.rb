class Api::DimmerLampsController < Api::ApiController

  def index
    @room = Room.find params[:room_id]
    @dimmer_lamps = @room.dimmer_lamps
  end

  def show
    @room = Room.find params[:room_id]
    @dimmer_lamp = @room.dimmer_lamps.find params[:id]
  end


  def update
    @room = Room.find params[:room_id]
    @dimmer_lamp = @room.dimmer_lamps.find params[:id]
    if @dimmer_lamp.update_attribute :status, params[:status]
      render :show
    else
      render text: 'APP_ERROR', status: 500
    end
  end
end
