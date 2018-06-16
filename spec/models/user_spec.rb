require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a email, user name and password" do
    user = build(:short_name_user)
    user.valid?
    expect(user.errors[:user_name]).to include("is too short (minimum is 4 characters)")
  end

  it "is valid with a email, user name and password" do
    user = build(:user)
    expect(user).to be_valid
  end

  it "is invalid without a email" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid without a user name" do
    user = User.new(user_name: nil)
    user.valid?
    expect(user.errors[:user_name]).to include("can't be blank")
  end

  it "is invalid without an password" do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "is invalid with a duplicate email address" do
    User.create(
      email: 'fancyfrank@gmail.com',
      user_name: 'Arnie',
      password: 'illbeback',
    )
    user = build(:user)
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
end
