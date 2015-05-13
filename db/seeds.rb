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
    setting_city.photo_url = 'cities/budapest_img.jpg'
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
    setting_city.photo_url = 'cities/kyoto_img.jpg'
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
  result = attraction['photo_url']
  if index < 64
    if result.nil?
      image= BingSearch.image(attraction['name']+' Bangkok', filters: [:square]).first
      if image.nil?
        result = "ADD ME MOFO"
      else
        result = image.media_url
      end
    end
    a.photo_url = result
    City.find_by(name: 'Bangkok').attractions << a
    a.save
  elsif index < 136
    if result.nil?
      image= BingSearch.image(attraction['name']+' Beirut', filters: [:square]).first
      if image.nil?
        result = "ADD ME MOFO"
      else
        result = image.media_url
      end
    end
    a.photo_url = result
    City.find_by(name: 'Beirut').attractions << a
    a.save
  elsif index < 155
    if result.nil?
      image= BingSearch.image(attraction['name']+' Budapest', filters:  [:square]).first
      if image.nil?
        result = "ADD ME MOFO"
      else
        result = image.media_url
      end
    end
    a.photo_url = result
    City.find_by(name: 'Budapest').attractions << a
    a.save
  elsif index < 214
    if result.nil?
      image= BingSearch.image(attraction['name']+' Cape Town', filters:  [:square]).first
      if image.nil?
        result = "ADD ME MOFO"
      else
        result = image.media_url
      end
    end
    a.photo_url = result
    City.find_by(name: 'Cape Town').attractions << a
    a.save
  elsif index <285
    if result.nil?
      image= BingSearch.image(attraction['name']+' Detroit', filters:  [:square]).first
      if image.nil?
        result = "ADD ME MOFO"
      else
        result = image.media_url
      end
    end
    a.photo_url = result
    City.find_by(name: 'Detroit').attractions << a
    a.save
  elsif index <347
    if result.nil?
      image= BingSearch.image(attraction['name']+' Florence', filters:  [:square]).first
      if image.nil?
        result = "ADD ME MOFO"
      else
        result = image.media_url
      end
    end
    a.photo_url = result
    City.find_by(name: 'Florence').attractions << a
    a.save
  elsif index <412
    if result.nil?
      image= BingSearch.image(attraction['name']+' Istanbul', filters:  [:square]).first
      if image.nil?
        result = "ADD ME MOFO"
      else
        result = image.media_url
      end
    end
    a.photo_url = result
    City.find_by(name: 'Istanbul').attractions << a
    a.save
  elsif index <482
    if result.nil?
      image= BingSearch.image(attraction['name']+' Krakow', filters: [:square]).first
      if image.nil?
        result = "ADD ME MOFO"
      else
        result = image.media_url
      end
    end
    a.photo_url = result
    City.find_by(name: 'Krakow').attractions << a
    a.save
  elsif index <556
    if result.nil?
      image= BingSearch.image(attraction['name']+' Kyoto', filters: [:square]).first
      if image.nil?
        result = "ADD ME MOFO"
      else
        result = image.media_url
      end
    end
    a.photo_url = result
    City.find_by(name: 'Kyoto').attractions << a
    a.save
  elsif index <633
    if result.nil?
      image= BingSearch.image(attraction['name']+' Paris', filters: [:square]).first
      if image.nil?
        result = "ADD ME MOFO"
      else
        result = image.media_url
      end
    end
    a.photo_url = result
    City.find_by(name: 'Paris').attractions << a
    a.save
  elsif index <699
    if result.nil?
      image= BingSearch.image(attraction['name']+' Rio de Janeiro', filters:  [:square]).first
      if image.nil?
        result = "ADD ME MOFO"
      else
        result = image.media_url
      end
    end
    a.photo_url = result
    City.find_by(name: 'Rio de Janeiro').attractions << a
    a.save
  elsif index <757
    if result.nil?
      image= BingSearch.image(attraction['name']+' San Francisco', filters:  [:square]).first
      if image.nil?
        result = "ADD ME MOFO"
      else
        result = image.media_url
      end
    end
    a.photo_url = result
    City.find_by(name: 'San Francisco').attractions << a
    a.save
  elsif index <822
    if result.nil?
      image= BingSearch.image(attraction['name']+' Sydney', filters: [:square]).first
      if image.nil?
        result = "ADD ME MOFO"
      else
        result = image.media_url
      end
    end
    a.photo_url = result
    City.find_by(name: 'Sydney').attractions << a
    a.save
  elsif index <897
    if result.nil?
      image= BingSearch.image(attraction['name']+' Sydney', filters: [:square]).first
      if image.nil?
        result = "ADD ME MOFO"
      else
        result = image.media_url
      end
    end
    a.photo_url = result
    City.find_by(name: 'Vienna').attractions << a
    a.save
  end
end
