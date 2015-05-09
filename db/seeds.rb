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
json1 = File.read('kimonoData.json')
parsed1 = JSON.parse(json1)
json2 = File.read('paris_sf_test2.json')
parsed2 = JSON.parse(json2)

raise ('JSON FILES NOT IN ACCORDANCE') unless parsed1['results']['collection1'].length == parsed2['rows'].length

i=0

while i<parsed1['results']['collection1'].length
  if parsed1['results']['collection1'][i]['description'].nil?
    i+=1
  elsif i<20
    result = BingSearch.image(parsed1['results']['collection1'][i]['name']+' paris', filters: [:square]).first.media_url
    a = Attraction.create(name: parsed1['results']['collection1'][i]['name'], address: parsed1['results']['collection1'][i]['address'], description: parsed1['results']['collection1'][i]['description'], photo_url: result, query_slug: parsed2['rows'][i]['wiki+city'], rank: parsed2['rows'][i]['base_rank'].to_i, top_quote:  parsed2['rows'][i]['top_quote'])
    paris.attractions << a
    i+=1
  else
    result = BingSearch.image(parsed1['results']['collection1'][i]['name']+' san francisco', filters: [:square]).first.media_url
    a = Attraction.create(name: parsed1['results']['collection1'][i]['name'], address: parsed1['results']['collection1'][i]['address'], description: parsed1['results']['collection1'][i]['description'], photo_url: result, query_slug: parsed2['rows'][i]['wiki+city'], rank: parsed2['rows'][i]['base_rank'].to_i, top_quote:  parsed2['rows'][i]['top_quote'])
    sf.attractions << a
    i+=1
  end
end

# parsed1['results']['collection1'].each_with_index do |attraction,index|
#   p attraction
#   next if attraction['description'].nil?
#   if index < 20
#     result = BingSearch.image(attraction['name']+' paris', filters: [:square]).first.media_url
#     a = Attraction.create(name: attraction['name'], address: attraction['address'], description: attraction['description'], photo_url: result )
#     paris.attractions << a
#   else
#     result = BingSearch.image(attraction['name']+' san francisco', filters: [:square]).first.media_url
#     a = Attraction.create(name: attraction['name'], address: attraction['address'], description: attraction['description'], photo_url: result )
#     sf.attractions << a
#   end
# end