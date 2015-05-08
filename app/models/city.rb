class City < ActiveRecord::Base
  has_many :attractions
  has_many :city_users
  has_many :users, through: :city_users
end
