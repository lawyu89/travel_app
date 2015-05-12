require 'rails_helper'
# to run one test: be rspec spec/features/city_spec.rb:50

describe "routes", js: true do
  before(:each) do 
    @bangkok = City.create(name:"Bangkok", description:"one night in bangkok", photo_url:"http://images.vanityfair.it/Storage/Assets/Crops/334784/53/165829/Bangkok_980x571.jpg")
    @beirut = City.create(name:"Beirut", description:"one night in beirut")
    @budapest = City.create(name:"Budapest", description:"one night in budapest")
    @istanbul = City.create(name:"Istanbul", description:"one night in istanbul")
    @cape_town = City.create(name:"Cape Town", description:"one night in cape")
    @cape_town = City.create(name:"Paris", description:"one night in paris")
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

  describe "the home page & city attractions routes" do
    scenario "homepage renders with city pictures on it " do
      visit '/cities'
      expect(page).to have_content('SwipeSee')
      # save_and_open_page 
    end

    scenario "city attractions has div & renders correct content " do
      visit city_attractions_path(@bangkok)
      expect(page).to have_content('test1')
      # save_and_open_page 
    end

    scenario "clicking LHS button moves to the second attraction " do
      visit city_attractions_path(@bangkok)
      # save_and_open_page 
      find_by_id('leftb').click
      expect(page).to have_content('test2')
      # save_and_open_page 
    end

    scenario "clicking RHS button moves to the second attraction " do
      visit city_attractions_path(@bangkok)
      # save_and_open_page 
      find_by_id('rightb').click
      expect(page).to have_content('test2')
      # save_and_open_page 
    end

    scenario "clicking info button flips to the description of attraction " do
      visit city_attractions_path(@bangkok)
      # save_and_open_page 
      find_by_id('midb').click
      expect(page).to have_content('test describe1')
      # save_and_open_page 
    end
  end 

  describe "user's signup process" do
    scenario "user is redirected after clicking Sign Up" do
      visit cities_path
      click_link('Signup')
      expect(page).to have_content('Sign Up')
    end

    scenario "valid user can signup" do
      visit new_user_path
      fill_in('Username', :with => "Bob")
      fill_in('Email', :with => "Bob@gmail.com")
      fill_in('Password', :with => "password123")
      click_button 'Sign Up'
      user = User.last
      expect(user.username).to eq('Bob')
      expect(user.email).to eq('Bob@gmail.com')
      expect(page.current_path).to eq(cities_path) 
    end

    scenario "invalid user cannot signup" do
      visit new_user_path
      fill_in('Email', :with => "Joe@gmail.com")
      fill_in('Password', :with => "password123")
      click_button 'Sign Up'
      user = User.last
      expect(user).to eq(nil)
      expect(page.current_path).to eq(new_user_path)
    end

    scenario "invalid user cannot signup" do
      visit new_user_path
      fill_in('Email', :with => "Joe@gmail.com")
      fill_in('Password', :with => "123")
      click_button 'Sign Up'
      user = User.last
      expect(user).to eq(nil)
      expect(page.current_path).to eq(new_user_path)
    end

    scenario "invalid user cannot signup" do
      visit new_user_path
      fill_in('Username', :with => "Bob")
      fill_in('Password', :with => "123456")
      click_button 'Sign Up'
      user = User.last
      expect(user).to eq(nil)
      expect(page.current_path).to eq(new_user_path)
    end
  end

    scenario "valid user can sign up" do
    visit cities_path
    # find_by_id('search-form')
    click_on('Signup')
    sleep(2)
    expect(page.current_path).to eq new_user_path
  end

  describe "current_user", js: true, :type => :controller do
    before(:each) do 
      visit new_user_path
      fill_in('Username', :with => "test")
      fill_in('Email', :with => "test@gmail.com")
      fill_in('Password', :with => "password123")
      click_button 'Sign Up'
      @current_user = User.last
    end

    # scenario "existing user can sign in" do 
    #   visit root_path
    #   click_link 'log'

    # end

    scenario "current user clicking RHS to like attraction and view to next attraction" do
      session[:user_id] = @current_user.id
      visit city_attractions_path(@bangkok)
      find_by_id('rightb').click
      expect(page).to have_content('test2')
      attraction = @current_user.attractions.last
      expect(attraction.name).to eq('test1')
      expect(@current_user.cities.map(&:name).first).to eq('Bangkok') 
    end

    scenario "clicking LHS button moves to the second attraction " do
      session[:user_id] = @current_user.id
      visit city_attractions_path(@bangkok)
      # save_and_open_page 
      find_by_id('leftb').click
      expect(page).to have_content('test2')
      expect(@current_user.user_attractions.last.preference).to eq(false)
      # save_and_open_page 
    end

    scenario "clicking info button flips to the description of attraction " do
      session[:user_id] = @current_user.id
      visit city_attractions_path(@bangkok)
      # save_and_open_page 
      find_by_id('midb').click
      expect(page).to have_content('test describe1')
      # save_and_open_page 
    end

    scenario "display all the cities that the user have liked" do
      session[:user_id] = @current_user.id
      visit city_attractions_path(@bangkok)
      find_by_id('rightb').click
      find_by_id('rightb').click
      find(".heart").click
        sleep(2)
      expect(page.current_path).to eq mycities_path
      expect(page).to have_content('Bangkok')
    end

    scenario "display all the attractions for a city that the user likes" do
      # @current_user.attractions << @attraction1
      # @current_user.attractions << @attraction2
      visit mycities_path(@current_user)
      session[:user_id] = @current_user.id
      visit city_attractions_path(@bangkok)
      find_by_id('rightb').click
      find_by_id('rightb').click
      find(".heart").click
      page.find('.square_city').click
      expect(page).to have_content("test1")
      expect(page).to have_content("test2")
    end

    scenario "user return to home page after logging out" do
      session[:user_id] = @current_user.id 
      city_attractions_path(@bangkok)
      page.find('.log').click
      sleep(2)
      expect(page.current_path).to eq(root_path)
    end

    # scenario "user session is deleted after logging out" do
    #   session[:user_id] = @current_user.id 
    #   city_attractions_path(@bangkok)
    #   page.find('.log').click
    #   expect(session[:user_id]).to eq(nil)
    # end
  end
end
