require 'rails_helper'

RSpec.describe City, type: :model do
  context "#associations" do
    it {should have_many :attractions}
    it {should have_many :city_users}
    it {should have_many :users}
  end
end 