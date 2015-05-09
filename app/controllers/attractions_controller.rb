class AttractionsController < ApplicationController

  def index
    city = City.where(id: params[:city_id]).first
    @attractions = city.attractions
  end
end
