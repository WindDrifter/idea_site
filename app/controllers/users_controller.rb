class UsersController < ApplicationController
  def new
      @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to ideas_path
    else
      flash[:alert] = "see errors"
      render :new
    end

  end

  def destroy

  end

  def update

  end

  def edit

  end

private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
  end


end
