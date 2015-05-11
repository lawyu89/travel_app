require 'JSON'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

require 'bing-search'

City.destroy_all
Attraction.destroy_all
BingSearch.account_key = ENV['API_KEY']


#Seed City Data
cities = JSON.parse(File.read('final_cities.json'))['rows']
cities.each do |city|
  setting_city = City.new(name: city['name'], country: city['country'], description: city['description'])
  if city['name'] == 'Bangkok'
    setting_city.photo_url = 'cities/bangkok_img.jpg'
  elsif city['name'] == 'Beirut'
    setting_city.photo_url = 'cities/beirut_img.jpg'
  elsif city['name'] == 'Budapest'
    setting_city.photo_url = 'cities/dudapest_img.jpg'
  elsif city['name'] == 'Cape Town'
    setting_city.photo_url = 'cities/cape_town_img.jpg'
  elsif city['name'] == 'Detroit'
    setting_city.photo_url = 'cities/detroit_img.jpg'
  elsif city['name'] == 'Florence'
    setting_city.photo_url = 'cities/florence_img.jpg'
  elsif city['name'] == 'Istanbul'
    setting_city.photo_url = 'cities/istanbul_img.jpg'
  elsif city['name'] == 'Krakow'
    setting_city.photo_url = 'cities/krakow_img.jpg'
  elsif city['name'] == 'Kyoto'
    setting_city.photo_url = 'citie/kyoto_img.jpg'
  elsif city['name'] == 'Paris'
    setting_city.photo_url = 'cities/paris_img.jpg'
  elsif city['name'] == 'Rio de Janeiro'
    setting_city.photo_url = 'cities/rio_img.jpg'
  elsif city['name'] == 'San Francisco'
    setting_city.photo_url = 'cities/san_francisco_img.jpg'
  elsif city['name'] == 'Sydney'
    setting_city.photo_url = 'cities/sydney_img.jpg'
  elsif city['name'] == 'Vienna'
    setting_city.photo_url = 'cities/vienna_img.jpg'
  end
  setting_city.save
end


#Seed Attraction Data
attractions = JSON.parse(File.read('final_attractions_sorted.json'))['rows']
attractions.each_with_index do |attraction,index|
  next if attraction['description'].length <1
  a = Attraction.new(name: attraction['name'], rank: attraction['rank'].to_i, query_slug: attraction['query_slug'], description: attraction['description'], top_quote: attraction['top_quote'])
  if index < 64
    result = BingSearch.image(attraction['name']+' Bangkok', filters: [:square, :medium]).first
    if result.nil?
      a.photo_url = "ADD ME MOFO"
    else
      a.photo_url = result.media_url
    end
    City.find_by(name: 'Bangkok').attractions << a
    a.save
  elsif index < 136
    result = BingSearch.image(attraction['name']+' Beirut', filters: [:square, :medium]).first
    if result.nil?
      a.photo_url = "ADD ME MOFO"
    else
      a.photo_url = result.media_url
    end
    City.find_by(name: 'Beirut').attractions << a
    a.save
  elsif index < 155
    result = BingSearch.image(attraction['name']+' Budapest', filters: [:square, :medium]).first
    if result.nil?
      a.photo_url = "ADD ME MOFO"
    else
      a.photo_url = result.media_url
    end
    City.find_by(name: 'Budapest').attractions << a
    a.save
  elsif index < 214
    result = BingSearch.image(attraction['name']+' Cape Town', filters: [:square, :medium]).first
    if result.nil?
      a.photo_url = "ADD ME MOFO"
    else
      a.photo_url = result.media_url
    end
    City.find_by(name: 'Cape Town').attractions << a
    a.save
  elsif index <285
    result = BingSearch.image(attraction['name']+' Detroit', filters: [:square, :medium]).first
    if result.nil?
      a.photo_url = "ADD ME MOFO"
    else
      a.photo_url = result.media_url
    end
    City.find_by(name: 'Detroit').attractions << a
    a.save
  elsif index <347
    result = BingSearch.image(attraction['name']+' Florence', filters: [:square, :medium]).first
    if result.nil?
      a.photo_url = "ADD ME MOFO"
    else
      a.photo_url = result.media_url
    end
    City.find_by(name: 'Florence').attractions << a
    a.save
  elsif index <412
    result = BingSearch.image(attraction['name']+' Istanbul', filters: [:square, :medium]).first
    if result.nil?
      a.photo_url = "ADD ME MOFO"
    else
      a.photo_url = result.media_url
    end
    City.find_by(name: 'Istanbul').attractions << a
    a.save
  elsif index <482
    result = BingSearch.image(attraction['name']+' Krakow', filters: [:square, :medium]).first
    if result.nil?
      a.photo_url = "ADD ME MOFO"
    else
      a.photo_url = result.media_url
    end
    City.find_by(name: 'Krakow').attractions << a
    a.save
  elsif index <556
    result = BingSearch.image(attraction['name']+' Kyoto', filters: [:square, :medium]).first
    if result.nil?
      a.photo_url = "ADD ME MOFO"
    else
      a.photo_url = result.media_url
    end
    City.find_by(name: 'Kyoto').attractions << a
    a.save
  elsif index <633
    result = BingSearch.image(attraction['name']+' Paris', filters: [:square, :medium]).first
    if result.nil?
      a.photo_url = "ADD ME MOFO"
    else
      a.photo_url = result.media_url
    end
    City.find_by(name: 'Paris').attractions << a
    a.save
  elsif index <699
    result = BingSearch.image(attraction['name']+' Rio de Janeiro', filters: [:square, :medium]).first
    if result.nil?
      a.photo_url = "ADD ME MOFO"
    else
      a.photo_url = result.media_url
    end
    City.find_by(name: 'Rio de Janeiro').attractions << a
    a.save
  elsif index <757
    result = BingSearch.image(attraction['name']+' San Francisco', filters: [:square, :medium]).first
    if result.nil?
      a.photo_url = "ADD ME MOFO"
    else
      a.photo_url = result.media_url
    end
    City.find_by(name: 'San Francisco').attractions << a
    a.save
  elsif index <822
    result = BingSearch.image(attraction['name']+' Sydney', filters: [:square, :medium]).first
    if result.nil?
      a.photo_url = "ADD ME MOFO"
    else
      a.photo_url = result.media_url
    end
    City.find_by(name: 'Sydney').attractions << a
    a.save
  elsif index <897
    result = BingSearch.image(attraction['name']+' Sydney', filters: [:square, :medium]).first
    if result.nil?
      a.photo_url = "ADD ME MOFO"
    else
      a.photo_url = result.media_url
    end
    City.find_by(name: 'Vienna').attractions << a
    a.save
  end
end


# BingSearch.account_key = ENV['API_KEY']
# sf_results = BingSearch.image('san francisco', filters: [:square]).first.media_url
# paris_results = BingSearch.image('paris', filters: [:square]).first.media_url
# sf = City.create(name: "San Francisco", photo_url: sf_results)
# paris = City.create(name: "Paris", photo_url: paris_results)
# # City.create(name: "San Francisco", photo_url: BingSearch.image('San Francisco'))
# json1 = File.read('kimonoData.json')
# parsed1 = JSON.parse(json1)
# json2 = File.read('paris_sf_test2.json')
# parsed2 = JSON.parse(json2)

# raise ('JSON FILES NOT IN ACCORDANCE') unless parsed1['results']['collection1'].length == parsed2['rows'].length

# i=0

# while i<parsed1['results']['collection1'].length
#   if parsed1['results']['collection1'][i]['description'].nil?
#     i+=1
#   elsif i<20
#     result = BingSearch.image(parsed1['results']['collection1'][i]['name']+' paris', filters: [:square]).first.media_url
#     a = Attraction.create(name: parsed1['results']['collection1'][i]['name'], address: parsed1['results']['collection1'][i]['address'], description: parsed1['results']['collection1'][i]['description'], photo_url: result, query_slug: parsed2['rows'][i]['wiki+city'], rank: parsed2['rows'][i]['base_rank'].to_i, top_quote:  parsed2['rows'][i]['top_quote'])
#     paris.attractions << a
#     i+=1
#   else
#     result = BingSearch.image(parsed1['results']['collection1'][i]['name']+' san francisco', filters: [:square]).first.media_url
#     a = Attraction.create(name: parsed1['results']['collection1'][i]['name'], address: parsed1['results']['collection1'][i]['address'], description: parsed1['results']['collection1'][i]['description'], photo_url: result, query_slug: parsed2['rows'][i]['wiki+city'], rank: parsed2['rows'][i]['base_rank'].to_i, top_quote:  parsed2['rows'][i]['top_quote'])
#     sf.attractions << a
#     i+=1
#   end
# end
