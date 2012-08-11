class Api::LampsController < Api::ApiController

  def index
    @room = Room.find params[:room_id]
    @lamps = @room.lamps
  end

  def show
    @room = Room.find params[:room_id]
    @lamp = @room.lamps.find params[:id]
  end

  def on
    @room = Room.find params[:room_id]
    @lamp = @room.lamps.find params[:id]
    render text: 'APP_ERROR', status: 500 and return unless @lamp.on!
    render :show
  end

  def off
    @room = Room.find params[:room_id]
    @lamp = @room.lamps.find params[:id]
    render text: 'APP_ERROR', status: 500 and return unless @lamp.off!
    render :show
  end

  def on_all
    @room = Room.find params[:room_id]
    @lamps = @room.lamps
    @lamps.each do |lamp|
      lamp.on!
    end
    render :index
  end

  def off_all
    @room = Room.find params[:room_id]
    @lamps = @room.lamps
    @lamps.each do |lamp|
      lamp.off!
    end
    render :index
  end
end
