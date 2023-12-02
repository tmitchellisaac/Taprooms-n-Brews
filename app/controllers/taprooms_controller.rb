class TaproomsController < ApplicationController

  def index
    @taprooms = Taproom.order("created_at")
  end

  def show
    @taproom = Taproom.find(params[:id])
  end
  
  def new
    # @new_taproom = Taproom.create
  end

  def create
    @taproom = Taproom.create({
      name: params[:taproom_name],
      address: params[:taproom_address],
      website: params[:taproom_website],
      phone_number: params[:taproom_phone],
      established: params[:established],
      number_of_employees: params[:number_of_employees],
      serving_capacity: params[:serving_capacity],
      offers_food: params[:offers_food]
    })

    redirect_to '/taprooms'
  end
end