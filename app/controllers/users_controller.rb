class UsersController < ApplicationController
  #before_action :is_matching_login_user, only: [:edit, :update, :create, :index, :show]
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path(user.id) 
    else
      render :new
    end
  end
  
  def index
    flash[:notice] = "Welcome! You have signed up successfully."
    @books=Book.all
    @book=Book.new
  end
  
  
  def show
    @user=User.find(params[:id])
    @books=@user.books
  end

  def edit
    @user=User.find(params[:id])
  end
  
  def update
    @user=User.find(params[:id])
    @user.update
    redirect_to users_path(user.id)
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
