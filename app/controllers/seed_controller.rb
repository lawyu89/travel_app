class SeedController < ApplicationController
  def index
    BingSearch.account_key = ENV['API_KEY']
    sf_results = BingSearch.image('san francisco', filters: [:square]).first
    sf = City.where(name: "San Fransisco").first
    sf.photo_url = sf_results.media_url
    sf.save

    paris = City.where(name: "Paris").first
    paris_results = BingSearch.image('paris', filters: [:square]).first
    paris.photo_url = paris_results.media_url
    paris.save
  end

  def attr
    BingSearch.account_key = ENV['API_KEY']
    results = BingSearch.image(params[:id], filters: [:square]).first
    p results.media_url
  end
end
