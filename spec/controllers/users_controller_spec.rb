require 'rails_helper'

describe UsersController do
  let(:user) { User.new(email: "dan@dan.dan", password:"1234") }

  describe "GET #index" do
    it "displays all users" do
      get :index
      expect(assigns(User.all)).to eq(@users)
    end
  end

  describe "GET #show" do
    it "assigns the requested user as @user" do
      get :show, { user_id: user.to_param }
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET #new" do
    it "gets a new user" do
      get :new
      expect(user).to be_a User
    end
  end

  describe "POST create" do
    context "when valid params are passed" do
      it "creates a new User" do
        expect{post :create, user: { email: 'dan@dan1.com', password: "1234" }}.to change{User.count}.by(1)
      end
    end
  end
end