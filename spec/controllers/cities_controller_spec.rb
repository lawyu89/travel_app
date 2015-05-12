require 'rails_helper'

RSpec.describe CitiesController, type: :controller do

  describe "GET #index" do
    before(:each) do
      get :index
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'assigns the @cities instance variable' do
      expect(assigns :cities).to be_a(City::ActiveRecord_Relation)
    end
  end #end of Get index tests 

  describe "GET #my_cities_index" do

    it "redirects to cities_path if no user logged in" do 
       get :my_cities_index
      expect(response).to have_http_status(302)
    end 

    xit "show my cities if user is logged in" do 
      city = City.create(name:"test city")
      user = User.create(email:"test@test.com", password:"test")
      city_user = CityUser.create(user_id: user.id, city_id: city.id)
      get :my_cities_index, current_user: user, cities: user.cities
      expect(response).to have_http_status(:success)
    end 

  end #end of GET my cities tests

end
