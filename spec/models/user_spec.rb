# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require "spec_helper"

describe User do

  before do
   @user = User.new( first_name: "Douglas", email: "douglasking215@gmail.com", last_name: "King", password: "foobar", password_confirmation: "foobar")
  end

  subject { @user } 

  it { should respond_to( :first_name, :last_name, :email, :password, :password_confirmation, :password_digest, :authenticate)}

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email)}

    describe "with valid password" do
      it { should == found_user.authenticate(@user.password)}
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid")}

      it { should_not == user_for_invalid_password }

      specify { user_for_invalid_password.should be_false}
    end

  end 

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "A" * 5}
    it { should be_invalid}
  end

  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when password is != password_confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end
  
  describe "when password_confirmation is nil" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end


  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
       addresses.each { |x| 
        @user.email = x
        @user.should_not be_valid
       }
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp foo+a+b@baz.cn]
       addresses.each { |x| 
        @user.email = x
        @user.should be_valid
       }
    end
  end

  describe "when email address is already taken" do
    before do 
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save

    end

    it {should_not be_valid}
  end


end
