require 'rails_helper'

RSpec.describe User, type: :model do

  context "#associations" do
    it {should have_many :city_users}
    it {should have_many :cities}
    it {should have_many :user_attractions}
    it {should have_many :attractions}
  end
 
  context "validations" do
    it "is valid without any tests right now" do
      user = User.new(username: "test name")
      expect(user).to be_valid
    end

    xit "is invalid without xxx" do
      user = User.new()
      expect(user).to_not be_valid
    end
  end


end
