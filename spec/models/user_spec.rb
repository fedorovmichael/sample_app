require 'rails_helper'

#RSpec.describe User, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"
#end

describe User do

   before do 
      @user = User.new(name: 'Example User', email: 'user@example1.com', password: "foobar", password_confirmation: "foobar")
   end
      
   subject { @user }
   it { should respond_to(:name) }
   it { should respond_to(:email) }
   it { should respond_to(:password_digest) }
   it { should respond_to(:password) }
   it { should respond_to(:password_confirmation) }

   it { should be_valid }
   
   describe "when name is not present" do
   
      before { @user.name = ' ' }
      it { should_not be_valid }   
   end
   
   describe "when email is not present" do
   
      before { @user.email = ' ' }
      it { should_not be_valid }
   
   end
   
   describe "when name is too long" do
   
      before { @user.name = 'a' * 21 }
      it { should_not be_valid }   
   end
   
   describe "when email alredy taken" do
   
      before do      
         user_with_same_email = @user.dup
         user_with_same_email.email = @user.email.upcase
         user_with_same_email.save
      end
      
      it { should_not be_valid }   
   end
   
  describe "return value of authenticate method" do
  
   before { @user.save }
   let(:user_found) { User.find_by(email: @user.email) }
   
   describe "valid user password" do
      it { should eq user_found.authenticate(@user.password) }
   end 
   
   describe "with invalid password" do
      let(:user_for_invalid_password) { user_found.authenticate("invalid") }
      it { should_not eq user_for_invalid_password}
         specify { expect(user_for_invalid_password).to be_falsey }
   
   end  
  end  
   
  describe "when password is not present" do
      before { @user.password = @user.password_confirmation = " " }
      it { should_not be_valid }
   end
   
  describe "when password doesn't match confirmation" do
      before { @user.password_confirmation = "mismatch" }
      it { should_not be_valid }
   end
   
   describe "with a password that's too short" do   
      before { @user.password = @user.password_confirmation = 'a' * 5 }
      it { should be_invalid }   
   end
   
end 
