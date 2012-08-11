class HomeController < ApplicationController
  def index
    gon.rooms_index_path = api_rooms_url
    gon.rooms_refresh_delay = 1000
    gon.initial_room_id = Room.first.id
  end
end
