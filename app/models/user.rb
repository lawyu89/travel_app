class User < ActiveRecord::Base
  has_many :city_users
  has_many :cities, through: :city_users
  has_many :user_attractions
  has_many :attractions, through: :user_attractions
  # validates :email, presence: true
  # validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :email, uniqueness: true
  # validates :password_confirmation, :presence => true, :if => '!password.nil?'
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

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid      = auth.uid
      user.email    = auth.info.email
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
