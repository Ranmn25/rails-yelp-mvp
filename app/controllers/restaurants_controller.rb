class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show, :edit]

  def index
    @restaurants = Restaurant.all
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render :new
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def show
  end
end

private

def find_restaurant
  @restaurant = Restaurant.find(params[:id])
end

def restaurant_params
  params.require(:restaurant).permit(:name, :address, :category)
end
