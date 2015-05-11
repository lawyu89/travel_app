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

  def like
    if current_user
      current_attraction = Attraction.where(id: params[:id]).first
      current_user.attractions << current_attraction
      current_user.attractions.where(id: params[:id]).first.preference = true
      current_user.attractions.where(id: params[:id]).first.city_id = params[:city_id]
      current_user.cities << City.where(id: params[:city_id]).first
      current_user.save
    end
  end

  def dislike
    if current_user
      current_attraction = Attraction.where(id: params[:id]).first
      current_user.attractions << current_attraction
      current_user.attractions.where(id: params[:id]).first.preference = false
      current_user.attractions.where(id: params[:id]).first.city_id = params[:city_id]
      current_user.cities << City.where(id: params[:city_id]).first
      current_user.save
    end
  end

  def test_my_city_index
    if current_user
      @user = @current_user
      @city = City.where(id: 1).first
      find_my_attractions(@city)
    else
      redirect_to cities_path
    end
  end

end
