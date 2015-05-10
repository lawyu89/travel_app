class AttractionsController < ApplicationController

  def index
    @city = City.where(id: params[:city_id]).first
    @attractions = @city.attractions.sort_by{|attra| attra.rank}
  end

  def show
    @attraction = Attraction.where(id: params[:id]).first
    render json: @attraction.to_json
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

  def my_attractions_show
    if current_user
      @user = @current_user
      @attraction = Attraction.where(id: params[:id]).first
    else
      redirect_to cities_path
    end
  end

end
