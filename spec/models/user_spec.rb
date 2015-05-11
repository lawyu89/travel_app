require 'rails_helper'

RSpec.describe User, type: :model do

  context "#associations" do
    it {should have_many :city_users}
    it {should have_many :cities}
    it {should have_many :user_attractions}
    it {should have_many :attractions}
  end
 
  context "validations" do
  
    it "is invalid with only username" do
      @invalid_user = User.create(username: "test")
      expect(@invalid_user).to_not be_valid
    end

    it "is valid with full info" do
      @valid_user = User.create(username: "test", email: "test@testy.com")
      expect(@valid_user).to be_valid
    end
  end


end
