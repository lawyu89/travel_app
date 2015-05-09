class AttractionsController < ApplicationController

  def index
    city = City.where(id: params[:city_id]).first
    @attractions = city.attractions
  end

  def my_attractions_index
    if current_user
      @user = @current_user
      @city = City.where(id: params[:city_id]).first
      find_my_attractions(@city)
    else
      redirect_to cities_path
    end
  end

end
