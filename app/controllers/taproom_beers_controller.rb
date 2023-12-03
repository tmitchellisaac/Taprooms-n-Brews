class TaproomBeersController < ApplicationController

  def index
    @taproom = Taproom.find(params[:taproom_id])
    @beers = @taproom.beers
  end

  def new
    @taproom = Taproom.find(params[:taproom_id])
  end

  def create
    @taproom = Taproom.find(params[:taproom_id])
    @beer = Beer.create({
      name: params[:name],
      style: params[:style],
      abv: params[:abv],
      price: params[:price],
      medal_winner: params[:medal_winner],
      taproom_id: @taproom.id
    })

    redirect_to "/taprooms/#{@taproom.id}/beers"
  end
end
