require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a email, user name and password" do
    user = User.new(
      email: "aa@aa.aa",
      user_name: "Aaaa",
      password: "P@ssword",
    )
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
      email: "aa@aa.aa",
      user_name: "Aaaa",
      password: "P@ssword"
    )
    user = User.new(
      email: "aa@aa.aa",
      user_name: "Bbbb",
      password: "P@sswordB",
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
end
