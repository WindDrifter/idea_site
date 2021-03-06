class SessionsController < ApplicationController

  def new
  end
  def create
    @user = User.find_by_email params[:email]
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to ideas_path, notice: "Signed in sucessfully"
    else
      flash[:alert] = "Wrong credentials"
      redirect_to ideas_path
    end

  end
  def destroy
    session[:user_id] = nil
    redirect_to ideas_path, notice: "Signed out sucessfully"
  end
end
