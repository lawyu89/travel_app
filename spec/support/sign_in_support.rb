module ValidUserHelper
  def signed_in_as_a_valid_user
    @user ||= User.create(username:"test", email:"test@test.com", password:"test")
    sign_in @user # method from devise:TestHelpers
  end
end