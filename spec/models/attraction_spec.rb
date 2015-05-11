require 'rails_helper'

RSpec.describe Attraction, type: :model do

  context "#associations" do
    it {should belong_to :city}
    it {should have_many :user_attractions}
    it {should have_many :users}
  end

  context "validations" do
    xit "is valid with xxxxx" do
      attraction = Attraction.new(name: "test name")
      expect(attraction).to be_valid
    end

    xit "is invalid without xxx" do
      attraction = Attraction.new()
      expect(attraction).to_not be_valid
    end
  end 



  end
