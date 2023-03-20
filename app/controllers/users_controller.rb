class UsersController < ApplicationController
  #before_action :is_matching_login_user, only: [:edit, :update], except: [:sign_in]
  before_action :authenticate_user!
  
  def index
    @books=Book.all
    @user=current_user
    @users=User.all
    @book=Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path
    else
      render '/users/:id'
    end
  end
  
  def show
    @books=Book.all
    @book=Book.new
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
