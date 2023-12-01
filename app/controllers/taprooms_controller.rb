class TaproomsController < ApplicationController

  def index
    @taprooms = Taproom.all
  end

  def show
    @taproom = Taproom.find(params[:id])
  end
  
end