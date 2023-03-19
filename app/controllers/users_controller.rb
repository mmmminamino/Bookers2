class UsersController < ApplicationController
  #before_action :is_matching_login_user, only: [:edit, :update], except: [:sign_in]
  before_action :authenticate_user!
  
  def index
  end
  
  
  def show
    #@books=@user.books
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
