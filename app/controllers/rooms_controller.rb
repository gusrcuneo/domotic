class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find params[:id]
    @devices = @room.devices
  end

  def edit
    @room = Room.find params[:id]
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new params[:room]
    if @room.save
      redirect_to room_path(@room), notice: 'Room created'
    else
      render :new
    end
  end


  def update
    @room = Room.find params[:id]
    if @room.update_attributes params[:room]
      redirect_to room_path(@room), notice: 'Room updated'
    else
      render :edit
    end
  end

end
