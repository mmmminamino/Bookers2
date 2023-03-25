class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :authenticate_user!
  
  def index
    @books=Book.all
    @user=current_user
    @users=User.all
    @book=Book.new
  end
  
  def show
    @user=current_user
    @books=Book.all
    @book_new=Book.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user=User.find(params[:id])
    @user.update(user_params)
    if @user.update(user_params)
      flash[:notice] ="You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render:edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id=current_user.id
      redirect_to users_path
    end
  end
end
