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
      @quote = ["GAME ROVER!", "We're bone dry!", "Round of Appaws!", "Doggonit, we're all out!"].sample
    else
      @city = City.where(id: params[:city_id]).first
      @attractions = @city.attractions.sort_by{|attra| attra.rank}
      @quote = ["GAME ROVER!", "We're bone dry!", "Round of Appaws!", "Doggonit, we're all out!"].sample
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

  def destroy
    attraction = Attraction.find(params[:id])
    current_user.user_attractions.where(attraction_id: attraction.id).first.destroy
    render json: attraction
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
    @attraction_ids = (params[:attractions])
    # @attraction_ids = JSON.parse(@attraction_ids).split(",").each_slice(3).to_json
    @city = City.where(id:params[:city_id]).first
  end

end
