class TaproomBeersController < ApplicationController

  def index
    taproom = Taproom.find(params[:taproom_id])
    @beers = taproom.beers
  end
end
