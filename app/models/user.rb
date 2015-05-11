class User < ActiveRecord::Base
  has_many :city_users
  has_many :cities, through: :city_users
  has_many :user_attractions
  has_many :attractions, through: :user_attractions
  validates :username, presence: true
  validates :email, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :email, uniqueness: true
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

  def validate_password_length(password)
    if password.length == 0
      self.errors[:base] << "Password can't be blank"
    elsif password.length <8
      self.errors[:base] << "Password needs to be at least 8 characters long"
    end
  end
end
