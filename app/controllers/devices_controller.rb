class DevicesController < ApplicationController
  def index
    @room = Room.find params[:room_id]
    @devices = @room.devices
  end

  def show
    @room = Room.find params[:room_id]
    @device = @room.devices.find params[:id]
  end

  def edit
    @room = Room.find params[:room_id]
    @device = @room.devices.find params[:id]
  end

  def new
    @room = Room.find params[:room_id]
    @device = @room.devices.new
  end

  def create
    @room = Room.find params[:room_id]
    @device = @room.devices.new params[:device]
    if @device.save
      redirect_to room_device_path(@room, @device), notice: 'Device created'
    else
      render :new
    end
  end


  def update
    @room = Room.find params[:room_id]
    @device = @room.devices.find params[:id]

    if @device.update_attributes params[@device.device_type]
      redirect_to room_device_path(@room, @device), notice: 'Device updated'
    else
      render :edit
    end
  end

end
