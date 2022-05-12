require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    
    it 'Will work with all fields submitted' do
      user = User.new
      user.first_name = 'demo'
      user.last_name ='demo'
      user.email = 'definitelyanEmail@email.com'
      user.password = 'Secret'
      user.password_confirmation = 'Secret'
      
      expect(user).to be_valid
    end

    it 'Will have a first name' do
      user = User.new
      user.first_name = nil
      user.last_name ='demo'
      user.email = 'definitelyanEmail@email.com'
      user.password = 'Secret'
      user.password_confirmation = 'Secret'
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to eq ["First name can't be blank"]

      user.first_name = 'demo'
      expect(user).to be_valid
    end

    it 'Will have a last name' do
      user = User.new
      user.first_name = 'demo'
      user.last_name = nil
      user.email = 'definitelyanEmail@email.com'
      user.password = 'Secret'
      user.password_confirmation = 'Secret'
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to eq ["Last name can't be blank"]

      user.last_name = 'demo'
      expect(user).to be_valid
    end

    it 'Will have a email' do
      user = User.new
      user.first_name = 'demo'
      user.last_name ='demo'
      user.email = nil
      user.password = 'Secret'
      user.password_confirmation = 'Secret'
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to eq ["Email can't be blank"]

      user.email = 'definitelyanEmail@email.com'
      expect(user).to be_valid
    end

    it 'Will have a matching passwords' do
      user = User.new
      user.first_name = 'demo'
      user.last_name ='demo'
      user.email = 'definitelyanEmail@email.com'
      user.password = 'Secret'
      user.password_confirmation = 'NotSecret'
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to eq ["Password confirmation doesn't match Password"]

      user.password_confirmation = 'Secret'
      expect(user).to be_valid
    end   
    
    it 'Will have a password' do
      user = User.new
      user.first_name = 'demo'
      user.last_name ='demo'
      user.email = 'definitelyanEmail@email.com'
      user.password = nil
      user.password_confirmation = 'Secret'
      expect(user).to_not be_valid
      expect(user.errors.full_messages[1]).to eq "Password can't be blank"
    end

    it 'Will have a password longer than 5 characters ' do
      user = User.new
      user.first_name = 'demo'
      user.last_name ='demo'
      user.email = 'definitelyanEmail@email.com'
      user.password = 'secre'
      user.password_confirmation = 'Secret'
      expect(user).to_not be_valid
      expect(user.errors.full_messages[1]).to eq "Password is too short (minimum is 6 characters)"
    end

    it 'Will have a unique email' do
      user = User.new
      user.first_name = 'demo'
      user.last_name ='demo'
      user.email = 'definitelyanEmail@email.com'
      user.password = 'Secret'
      user.password_confirmation = 'Secret'

      user.save

      user2 = User.new
      user2.first_name = 'demo'
      user2.last_name ='demo'
      user2.email = 'definitelyanEmail@email.com'
      user2.password = 'Secret'
      user2.password_confirmation = 'Secret'
      
      user2.save

      expect(user2).to_not be_valid
      expect(user2.errors.full_messages).to eq ["Email has already been taken"]

    end

  end

 


  describe '.authenticate_with_credentials' do

    it 'Will login with proper credentials' do
      user = User.new
      user.first_name = 'demo'
      user.last_name = 'demo'
      user.email = 'demo@demo.com'
      user.password = 'Secret'
      user.password_confirmation = 'Secret'
      
      user.save
      # Did not work with definitelyanEmail@email.com as an email!
      user = User.authenticate_with_credentials('demo@demo.com', 'Secret')
      expect(user).to_not be(nil)
    end

    it 'Will not login without proper credentials' do
      user = User.new
      user.first_name = 'demo'
      user.last_name = 'demo'
      user.email = 'demo@demo.com'
      user.password = 'Secret'
      user.password_confirmation = 'Secret'
      
      user.save
      # Did not work with definitelyanEmail@email.com as an email!
      user = User.authenticate_with_credentials('demo@demo.com', 'notSecret')
      expect(user).to be(nil)
    end

     it 'Will login with spaces on email ends ' do
      user = User.new
      user.first_name = 'demo'
      user.last_name = 'demo'
      user.email = 'demo@demo.com'
      user.password = 'Secret'
      user.password_confirmation = 'Secret'
      
      user.save
      # Did not work with definitelyanEmail@email.com as an email!
      user = User.authenticate_with_credentials('  demo@demo.com  ', 'Secret')
      expect(user).to_not be(nil)
    end

    it 'Will login with caps in email' do
      user = User.new
      user.first_name = 'demo'
      user.last_name = 'demo'
      user.email = 'demo@demo.com'
      user.password = 'Secret'
      user.password_confirmation = 'Secret'
      
      user.save
      # Did not work with definitelyanEmail@email.com as an email!
      user = User.authenticate_with_credentials('  dEmo@dEmO.com  ', 'Secret')
      expect(user).to_not be(nil)
    end
  end

end