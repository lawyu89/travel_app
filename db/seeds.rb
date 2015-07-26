# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

City.destroy_all
Attraction.destroy_all
BingSearch.account_key = ENV['API_KEY']

# Getting geocoding data for d'b:
def map_hell(attraction_name, city_name, attraction_object)
  maps_url = "https://maps.googleapis.com/maps/api/geocode/json"
  response = HTTParty.get(maps_url,
        :query => {key: ENV["MAP_KEY"],
      address: "#{attraction_name}, #{city_name}"})
  location = response.to_json.scan(/\"location":\{"lat":\-?\d+.?\d+,\"lng":\-?\d+\.?\d+\}/)
  if location[0]
    lat = location[0].scan(/(\-?\d+\.?\d+)/)[0][0]
    lng = location[0].scan(/(\-?\d+\.?\d+)/)[1][0]
    attraction_object.lat = lat
    attraction_object.long =lng
  else
    attraction_object.lat = nil
    attraction_object.long = nil
  end
  attraction_object.save
  sleep 1.2
end


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
        result = "ADD ME LATER"
      else
        result = image.media_url
      end
    end
    a.photo_url = result
    City.find_by(name: 'Bangkok').attractions << a
    a.save
    map_hell(attraction['name'], 'Bangkok', a)

  elsif index < 136
    if result.nil?
      image= BingSearch.image(attraction['name']+' Beirut', filters: [:square]).first
      if image.nil?
        result = "ADD ME LATER"
      else
        result = image.media_url
      end
    end
    a.photo_url = result
    City.find_by(name: 'Beirut').attractions << a
    a.save
    map_hell(attraction['name'], 'Beirut', a)
  elsif index < 155
    if result.nil?
      image= BingSearch.image(attraction['name']+' Budapest', filters:  [:square]).first
      if image.nil?
        result = "ADD ME LATER"
      else
        result = image.media_url
      end
    end
    a.photo_url = result
    City.find_by(name: 'Budapest').attractions << a
    a.save
    map_hell(attraction['name'], 'Budapest', a)
  elsif index < 214
    if result.nil?
      image= BingSearch.image(attraction['name']+' Cape Town', filters:  [:square]).first
      if image.nil?
        result = "ADD ME LATER"
      else
        result = image.media_url
      end
    end
    a.photo_url = result
    City.find_by(name: 'Cape Town').attractions << a
    a.save
    map_hell(attraction['name'], 'Cape Town', a)
  elsif index <285
    if result.nil?
      image= BingSearch.image(attraction['name']+' Detroit', filters:  [:square]).first
      if image.nil?
        result = "ADD ME LATER"
      else
        result = image.media_url
      end
    end
    a.photo_url = result
    City.find_by(name: 'Detroit').attractions << a
    a.save
    map_hell(attraction['name'], 'Detroit', a)

  elsif index <339
    if result.nil?
      image= BingSearch.image(attraction['name']+' Florence', filters:  [:square]).first
      if image.nil?
        result = "ADD ME LATER"
      else
        result = image.media_url
      end
    end
    a.photo_url = result
    City.find_by(name: 'Florence').attractions << a
    a.save
    map_hell(attraction['name'], 'Florence', a)
  elsif index <399
    if result.nil?
      image= BingSearch.image(attraction['name']+' Istanbul', filters:  [:square]).first
      if image.nil?
        result = "ADD ME LATER"
      else
        result = image.media_url
      end
    end
    a.photo_url = result
    City.find_by(name: 'Istanbul').attractions << a
    a.save
    map_hell(attraction['name'], 'Istanbul', a)
  elsif index <469
    if result.nil?
      image= BingSearch.image(attraction['name']+' Krakow', filters: [:square]).first
      if image.nil?
        result = "ADD ME LATER"
      else
        result = image.media_url
      end
    end
    a.photo_url = result
    City.find_by(name: 'Krakow').attractions << a
    a.save
    map_hell(attraction['name'], 'Krakow', a)
  elsif index <543
    if result.nil?
      image= BingSearch.image(attraction['name']+' Kyoto', filters: [:square]).first
      if image.nil?
        result = "ADD ME LATER"
      else
        result = image.media_url
      end
    end
    a.photo_url = result
    City.find_by(name: 'Kyoto').attractions << a
    a.save
    map_hell(attraction['name'], 'Kyoto', a)
  elsif index <620
    if result.nil?
      image= BingSearch.image(attraction['name']+' Paris', filters: [:square]).first
      if image.nil?
        result = "ADD ME LATER"
      else
        result = image.media_url
      end
    end
    a.photo_url = result
    City.find_by(name: 'Paris').attractions << a
    a.save
    map_hell(attraction['name'], 'Paris', a)
  elsif index <686
    if result.nil?
      image= BingSearch.image(attraction['name']+' Rio de Janeiro', filters:  [:square]).first
      if image.nil?
        result = "ADD ME LATER"
      else
        result = image.media_url
      end
    end
    a.photo_url = result
    City.find_by(name: 'Rio de Janeiro').attractions << a
    a.save
    map_hell(attraction['name'], 'Rio de Janeiro', a)
  elsif index <744
    if result.nil?
      image= BingSearch.image(attraction['name']+' San Francisco', filters:  [:square]).first
      if image.nil?
        result = "ADD ME LATER"
      else
        result = image.media_url
      end
    end
    a.photo_url = result
    City.find_by(name: 'San Francisco').attractions << a
    a.save
    map_hell(attraction['name'], 'San Francisco', a)
  elsif index <809
    if result.nil?
      image= BingSearch.image(attraction['name']+' Sydney', filters: [:square]).first
      if image.nil?
        result = "ADD ME LATER"
      else
        result = image.media_url
      end
    end
    a.photo_url = result
    City.find_by(name: 'Sydney').attractions << a
    a.save
    map_hell(attraction['name'], 'Sydney', a)
  else
    if result.nil?
      image= BingSearch.image(attraction['name']+' Vienna', filters: [:square]).first
      if image.nil?
        result = "ADD ME LATER"
      else
        result = image.media_url
      end
    end
    a.photo_url = result
    City.find_by(name: 'Vienna').attractions << a
    a.save
    map_hell(attraction['name'], 'Vienna', a)
  end
end




