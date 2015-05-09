class AttractionsController < ApplicationController

  def index
    p city = City.where(id: params[:city_id]).first
    @attractions = city.attractions
  end
end
