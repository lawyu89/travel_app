require 'rails_helper'

RSpec.describe AttractionsController, type: :controller do

  describe "GET #index" do
    before(:each) do
      @city = City.create(name:"test city", description:"this is a test")
    end

    it "returns http success whether user logged in or not " do
      get :index, city_id: @city.id
      expect(response).to have_http_status(:success)
    end

    it "shows xx if user logged in" do
    end 

    it "shows yyy if user is NOT logged in"do 
    end 


    
  end #end of Get index tests

  describe "GET #show" do

    it "returns json file of the attraction" do
      # create city & attraction detail
    # get the route
    # test for json 
    end
    
    
  end #end of GET #show tests 

  describe "POST #like route" do
    before(:each) do
      @city = City.create(name:"test city")
      @attraction = Attraction.create(name:"test church" ,description:"test")
      @user = User.create(email:"test@test.com", password:"test")
    end

    # it "should create a like preference for the user on attraction" do
    #   post :like, city_id: @city.id, id: @attraction.id
    #   @attraction.reload
    #   expect("user's preference for attraction").to eq(true)
      
    # end

    # it "redirects to the next page" do
    # post :like, id: @attraction
    # # expect(response).to redirect_to(new path here!?)
    # end
    
  end #end of POST #like tests

  describe "POST #dislike route" do

    it "should create a dislike preference for the user on attraction" do
      
    end
    
  end #end of POST #dislike tests




end
