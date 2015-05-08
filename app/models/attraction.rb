class Attraction < ActiveRecord::Base
  belongs_to :city
  has_many :likes
  has_many :users, through: :likes
  has_many :dislikes
  has_many :users, through: :dislikes
end
