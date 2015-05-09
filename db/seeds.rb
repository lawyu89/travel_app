require 'JSON'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

require 'bing-search'
# include HTTParty
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

City.destroy_all
Attraction.destroy_all
BingSearch.account_key = ENV['API_KEY']
sf_results = BingSearch.image('san francisco', filters: [:square]).first.media_url
paris_results = BingSearch.image('paris', filters: [:square]).first.media_url
sf = City.create(name: "San Francisco", photo_url: sf_results)
paris = City.create(name: "Paris", photo_url: paris_results)
# City.create(name: "San Francisco", photo_url: BingSearch.image('San Francisco'))
json = File.read('kimono_attraction.json')
parsed = JSON.parse(json)
parsed['results']['collection1'].each_with_index do |attraction,index|
  next if attraction['Description'].nil?
  if index < 20
    result = BingSearch.image(attraction['Name']+' paris', filters: [:square]).first.media_url
    a = Attraction.create(name: attraction['Name'], address: attraction['Address'], description: attraction['Description'], photo_url: result )
    paris.attractions << a
  else
    result = BingSearch.image(attraction['Name']+' san francisco', filters: [:square]).first.media_url
    a = Attraction.create(name: attraction['Name'], address: attraction['Address'], description: attraction['Description'], photo_url: result )
    sf.attractions << a
  end
end