require 'rails_helper'


# to run one test: be rspec spec/features/city_spec.rb:50

describe "the home page/ city index route", :js => true do
  before(:each) do 
    @bangkok = City.create(name:"Bangkok")
    @beirut = City.create(name:"Beirut")
    @budapest = City.create(name:"Budapest")
    @cape_town = City.create(name:"Cape Town")
    @detroit = City.create(name:"Detroit")
    @florence = City.create(name:"Florence")
    @kyoto = City.create(name:"Kyoto")
    @rio = City.create(name:"Rio de Janeiro")
    @san_fran = City.create(name:"San Francisco")
    @sydney = City.create(name:"Sydney")
    @vienna = City.create(name:"Vienna")
    
    @attraction1 = Attraction.create(name:"test1", city_id: @bangkok.id)
    @attraction2 = Attraction.create(name:"test2", city_id: @bangkok.id)
    @attraction3 = Attraction.create(name:"test3", city_id: @bangkok.id)
    @attraction4 = Attraction.create(name:"test4", city_id: @bangkok.id)
    @attraction5 = Attraction.create(name:"test5", city_id: @bangkok.id)
  end 

  scenario "homepage renders with city pictures on it " do
    visit '/cities'
    expect(page).to have_content('SwipeSee')
    save_and_open_page 
  end


  scenario "city attractions has div & renders correct content " do
    visit city_attractions_path(@bangkok)
    expect(page).to have_content('test1')
    save_and_open_page 
  end

  scenario "clicking RHS button moves to the second attraction " do
    visit city_attractions_path(@bangkok)
    save_and_open_page 
    find_by_id('leftb').click
    expect(page).to have_content('test2')
    save_and_open_page 
  end


  
end


