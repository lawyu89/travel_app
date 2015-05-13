class AttractionsController < ApplicationController

  def index
    if current_user
      @city = City.where(id: params[:city_id]).first
      @attractions = []
      @city.attractions.each do |attraction|
        if attraction.user_attractions.where(user_id: current_user.id).first == nil
          @attractions << attraction
        end
      end
      @attractions
      @attractions.sort_by{|attra| attra.rank}
      @quote = ["GAME ROVER!", "We're bone dry", "Round of Appaws! You've seen all the attractions!"].sample
    else
      @city = City.where(id: params[:city_id]).first
      @attractions = @city.attractions.sort_by{|attra| attra.rank}
      @quote = ["GAME ROVER!", "We're bone dry", "Round of Appaws! You've seen all the attractions!"].sample
    end
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
      @city= City.where(id: params[:city_id]).first
    else
      redirect_to cities_path
    end
  end

  def like
    if current_user
      attraction = UserAttraction.create(
        user_id: current_user.id,
        attraction_id: params[:id],
        city_id: params[:city_id],
        preference: true
        )

      city = City.where(id: params[:city_id]).first
      current_user.cities << city if !current_user.cities.include?(city)

      render json: attraction.to_json
    else
      placeholder = {"Who's the coolest?" => "Swipesee (furr real)"}
      render json: placeholder.to_json
    end
  end

  def dislike
    if current_user
      attraction = UserAttraction.create(
        user_id: current_user.id,
        attraction_id: params[:id],
        city_id: params[:city_id],
        preference: false
        )
      render json: attraction.to_json
    else
      placeholder = {"Who's the coolest?" => "Swipesee (furr real)"}
      render json: placeholder.to_json
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

  def test_my_attraction_map
    @city = City.where(id:2).first
    @attraction = Attraction.where(id:2).first
  end 

  def my_attractions_maps
    @city = City.where(id: params[:city_id]).first
    @attraction = Attraction.where(id: params[:id]).first
  end 

  def my_selected_map
    p params
    @attraction_ids = params[:attractions]
    @city = City.where(id:params[:city_id]).first
    my_array = []
    # @attraction_ids.each do |id|
    #   attraction = Attraction.find(id)
    #   my_array << attraction
    # end 
    # @my_array = my_array
  end 

end
