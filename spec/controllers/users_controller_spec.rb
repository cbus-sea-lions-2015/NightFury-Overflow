require 'rails_helper'

describe UsersController do
  let(:user) { User.new(email: "dan@dan.dan", password:"1234") }

  describe "GET #index" do
    it "displays all users" do
      get :index
      expect(assigns(User.all)).to eq(@users)
    end
  end
  
end