class User < ActiveRecord::Base
  has_many :city_users
  has_many :cities, through: :city_users
  has_many :likes
  has_many :pos_attractions, through: :likes, source: :Attraction, foreign_key: "attraction_id"
  has_many :dislikes
  has_many :neg_attractions, through: :dislikes, source: :Attraction, foreign_key: "attraction_id"
end
