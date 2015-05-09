class User < ActiveRecord::Base
  has_many :city_users
  has_many :cities, through: :city_users
  has_many :user_attractions
  has_many :attractions, through: :user_attractions

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(password)
    self.password == password
  end

end
