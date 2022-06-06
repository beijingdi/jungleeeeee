class User < ApplicationRecord
  has_secure_password
  validates :password, confirmation: true
  validates :password, length:{ minimum: 8 }
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  before_save { self.email = email.downcase }
  def self.authenticate_with_credentials(params)
    email = params[:email].strip.downcase
    @user = User.find_by_email(email)
    @user.authenticate(params[:password]) ? @user :nil
    # If the user exists AND the password entered is correct.
  end
end




