require 'rails_helper'

describe User do
  let(:user) { User.new(email: "dan@dan.dan", password: "1234") }

  it "is a user" do
    expect(user).to be_a User
  end

  it "has an email" do
    expect(user.email).not_to be nil
  end

  it "has a password" do
    expect(user.password).not_to be nil
  end

end