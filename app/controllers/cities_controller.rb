class CitiesController < ApplicationController

  def index
    @cities = City.all
    @user = current_user
  end

  def my_cities_index
    @user = current_user
    @cities = @user.cities
  end

  def test
    @user = current_user
    @cities = @user.cities
  end 

end
