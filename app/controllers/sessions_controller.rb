class SessionsController < ApplicationController
  skip_before_action :authenticate, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new, alert: "Incorrect username or password."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
