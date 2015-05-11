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
    before(:each) do
      get :my_cities_index
    end

    it "redirects to cities_path if no user logged in" do 
      expect(response).to have_http_status(302)
    end 

    it "show my cities if user is logged in" do 
    end 

  end #end of GET my cities tests

end
