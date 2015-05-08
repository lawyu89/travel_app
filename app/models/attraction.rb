class Attraction < ActiveRecord::Base
  belongs_to :city
  has_many :user_attractions
  has_many :users, through: :user_attractions
end
