require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "creates the user with valid inputs" do
      goodUser = User.new(:first_name => "Michr", :last_name => "DingDong", :email => "dogdogdog@dog.com", :password => "luvWoody", :password_confirmation => "luvWoody")
      assert goodUser.save!
    end
    it "won't create the user when the e-mail exists" do
      goodUser = User.create(:first_name => "Michr", :last_name => "DingDong", :email => "dogdogdog@dog.com", :password => "luvWoody", :password_confirmation => "luvWoody")
      goodUser.save
      sameEmailUser = User.new(:first_name => "Michr", :last_name => "DingDong", :email => "dogdogdog@dog.com", :password => "luvWoody", :password_confirmation => "luvWoody")
      assert_not sameEmailUser.save!
    end
    it "won't create the user when password confirmation doesn't match" do
      wrongPasswordUser = User.new(:first_name => "Michr", :last_name => "DingDong", :email => "dogdogdog@dog.com", :password => "luvWoody", :password_confirmation => "luvWooody")
      assert_not wrongPasswordUser.save!
    end
    it "won't create the user when the password has less than 8 characters" do
      shortPasswordUser = User.new(:first_name => "Michr", :last_name => "DingDong", :email => "dogdogdog@dog.com", :password => "luv", :password_confirmation => "luv")
      assert_not wrongPasswordUser.save!
    end
  end

  describe '.authenticate_with_credentials' do
    it "returns the user with correct credentials" do
      goodUser = User.create(:first_name => "Michr", :last_name => "DingDong", :email => "dogdogdog@dog.com", :password => "luvWoody", :password_confirmation => "luvWoody")
      expect(User.authenticate_with_credentials(:email =>"dogdogdog@dog.com", :password=> "luvWoody")).to eq(goodUser)
    end
    it "returns nil with wrong credentials" do
      goodUser = User.create(:first_name => "Michr", :last_name => "DingDong", :email => "dogdogdog@dog.com", :password => "luvWoody", :password_confirmation => "luvWoody")
      expect(User.authenticate_with_credentials(:email =>"dogdogdog@dog.com", :password=> "luvW0oody")).to eq(nil)
    end
    it "should ignore the white spaces at the beginning of user email" do
      goodUser = User.create(:first_name => "Michr", :last_name => "DingDong", :email => "dogdogdog@dog.com", :password => "luvWoody", :password_confirmation => "luvWoody")
      expect(User.authenticate_with_credentials(:email =>"    dogdogdog@dog.com", :password=> "luvWoody")).to eq(goodUser)
    end
    it "should ignore case of the user email when authenticating" do
      goodUser = User.create(:first_name => "Michr", :last_name => "DingDong", :email => "dogdogdog@dog.com", :password => "luvWoody", :password_confirmation => "luvWoody")
      expect(User.authenticate_with_credentials(:email =>"DogDogDog@dog.com", :password=> "luvWoody")).to eq(goodUser)
    end
  end
end
