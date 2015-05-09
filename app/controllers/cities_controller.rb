class CitiesController < ApplicationController

  def index
    @cities = City.all
    #@user = current_user

  end

end
