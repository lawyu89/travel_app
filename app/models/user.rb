class User < ActiveRecord::Base
  has_many :city_users
  has_many :cities, through: :city_users
  has_many :user_attractions
  has_many :attractions, through: :user_attractions
end
