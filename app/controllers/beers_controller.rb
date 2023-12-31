class BeersController < ApplicationController


  def index
    @beers = Beer.all
  end

  def show
    @beer = Beer.find(params[:id])
  end

  def edit
    @beer = Beer.find(params[:beer_id])
  end 

  def update
    beer = Beer.find(params[:beer_id])

    beer.update({
      name: params[:name],
      style: params[:style],
      abv: params[:abv],
      price: params[:price],
      medal_winner: params[:medal_winner],
    })
    
    beer.save

    redirect_to "/beers"
  end

  def destroy
    beer = Beer.find(params[:id])
    beer.destroy
    
    redirect_to "/beers"
  end
end
