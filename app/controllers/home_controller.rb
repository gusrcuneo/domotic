class HomeController < ApplicationController
  def index
    gon.rooms_index_path = api_rooms_url
    gon.rooms_refresh_delay = 3000
  end
end
