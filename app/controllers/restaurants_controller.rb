class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]


  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save # return false if validations don't pass
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def update
     @restaurant.update(restaurant_params)
    redirect_to restaurants_path(@restaurant)
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  def edit
  end



private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
     params.require(:restaurant).permit(:name, :address, :description, :phone_number, :category)
  end

end

