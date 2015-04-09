require 'rails_helper'

describe UsersController do
  let!(:user) { User.create(email: "dan@dan.dan", password:"1234") }
  let(:default_session) { {user_id: user.id} }

  describe "GET #index" do
    it "displays all users" do
      get :index
      expect(assigns(User.all)).to eq(@users)
    end
  end

  describe "GET #show" do
    it "assigns the requested user as @user" do
      get :show, {}, default_session
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
        expect {
          post :create, user: { email: 'dan@dan1.com', password: "1234" }
        }.to change{User.count}.by(1)
      end
    end
  end

  describe "DELETE #destroy" do
    it "redirects to the home page" do
      delete :destroy, {}, default_session
      expect(response).to redirect_to(root_path)
    end

    it "destroys the requested user" do
      expect {
        delete :destroy , {}, default_session
      }.to change(User, :count).by(-1)
    end
  end
   
end