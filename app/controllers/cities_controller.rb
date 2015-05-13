class CitiesController < ApplicationController

  def index
    @cities = City.all
    @user = current_user
  end

  def my_cities_index
    if current_user
      @user = current_user
      @cities = @user.cities
      @emptyquote = ["You haven't liked any attractions yet!"].sample
    else
      redirect_to cities_path
    end
  end

  # def test
  #   @user = current_user
  #   # @cities = @user.cities
  # end

  # def test_my_cities_index
  #   if current_user
  #     @user = current_user
  #     @cities = @user.cities
  #   else
  #     redirect_to cities_path
  #   end
  # end

end
