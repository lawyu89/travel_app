require 'rails_helper'


# to run one test: be rspec spec/features/city_spec.rb:50

describe "the home page/ city index route", :js => true do
  before(:each) do 
    @bangkok = City.create(name:"Bangkok", description:"one night in bangkok")
    @beirut = City.create(name:"Beirut", description:"one night in beirut")
    @budapest = City.create(name:"Budapest", description:"one night in budapest")
    @cape_town = City.create(name:"Cape Town", description:"one night in cape")
    @detroit = City.create(name:"Detroit", description:"one night in detroit")
    @florence = City.create(name:"Florence", description:"one night in florence")
    @kyoto = City.create(name:"Kyoto", description:"one night in kyoto")
    @rio = City.create(name:"Rio de Janeiro", description:"one night in rio")
    @san_fran = City.create(name:"San Francisco", description:"one night in sf")
    @sydney = City.create(name:"Sydney", description:"one night in sydney")
    @vienna = City.create(name:"Vienna", description:"one night in vienna")
    
    @attraction1 = Attraction.create(name:"test1", city_id: @bangkok.id, description:"test describe1")
    @attraction2 = Attraction.create(name:"test2", city_id: @bangkok.id, description:"test describe2")
    @attraction3 = Attraction.create(name:"test3", city_id: @bangkok.id, description:"test describe3")
    @attraction4 = Attraction.create(name:"test4", city_id: @bangkok.id, description:"test describe4")
    @attraction5 = Attraction.create(name:"test5", city_id: @bangkok.id, description:"test describe5")
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

  scenario "clicking LHS button moves to the second attraction " do
    visit city_attractions_path(@bangkok)
    save_and_open_page 
    find_by_id('leftb').click
    expect(page).to have_content('test2')
    save_and_open_page 
  end

  scenario "clicking RHS button moves to the second attraction " do
    visit city_attractions_path(@bangkok)
    save_and_open_page 
    find_by_id('rightb').click
    expect(page).to have_content('test2')
    save_and_open_page 
  end

  scenario "clicking info button flips to the description of attraction " do
    visit city_attractions_path(@bangkok)
    save_and_open_page 
    find_by_id('midb').click
    expect(page).to have_content('test describe1')
    save_and_open_page 
  end


  
end


