require 'rails_helper'

# describe "the questions paths", :js => true do
#   let(:question) {FactoryGirl.create :question}

#   scenario "homepage renders with Question on it" do
#     visit '/'
#     expect(page).to have_content('The amazing stack of Qs')
#     save_and_open_page
#     # sleep 5

#   end
# end 


describe "the home page/ city index route", :js => true do
  # @bangkok = City.create(name:"Bangkok")
  # @beirut = City.create(name:"Beirut")
  # @budapest = City.create(name:"Budapest")
  # @cape_town = City.create(name:"Cape Town")
  # @detroit = City.create(name:"Detroit")
  # @florence = City.create(name:"Florence")
  # @kyoto = City.create(name:"Kyoto")
  # @rio = City.create(name:"Rio de Janeiro")
  # @san_fran = City.create(name:"San Francisco")
  # @sydney = City.create(name:"Sydney")
  # @vienna = City.create(name:"Vienna")
  

  # @attraction1 = Attraction.create(name:"test1", city_id: @bangkok.id)
  # @attraction2 = Attraction.create(name:"test2", city_id: @bangkok.id)
  # @attraction3 = Attraction.create(name:"test3", city_id: @bangkok.id)
  # @attraction4 = Attraction.create(name:"test4", city_id: @bangkok.id)
  # @attraction5 = Attraction.create(name:"test5", city_id: @bangkok.id)

  scenario "homepage renders with city pictures on it " do
    visit '/cities'
    expect(page).to have_content('SwipeSee')
    save_and_open_page 
  end


  scenario "city attractions has div " do
    @bangkok = City.create(name:"Bangkok")
    @attraction1 = Attraction.create(name:"test1", city_id: @bangkok.id)
    @attraction2 = Attraction.create(name:"test2", city_id: @bangkok.id)
    @attraction3 = Attraction.create(name:"test3", city_id: @bangkok.id)
    @attraction4 = Attraction.create(name:"test4", city_id: @bangkok.id)
    @attraction5 = Attraction.create(name:"test5", city_id: @bangkok.id)
    visit city_attractions_path(@bangkok)
    expect(page).to have_content('test1')
    save_and_open_page 
  end


  
end


