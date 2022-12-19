class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if params[:id] == 'sign_out'
      sign_out current_user
      redirect_to root_path
    else
      @user = User.find(params[:id])
    end
  end

  def new
    @users = User.new
  end
end
