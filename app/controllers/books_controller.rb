class BooksController < ApplicationController
  def top
  end

  def index
    @books=Book.all
    @book=Book.new
    @user=current_user
    @users=User.all
  end

  def new
    @book=Book.new
  end
  
  def create
    @book= Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else 
      @books=Book.all
      render :index
    end
  end

  def show
    @new_book=Book.new
    @book=Book.find(params[:id])
    @user = @book.user
  end
  
  def edit
    @user=User.find(params[:id])
    @book=Book.find(params[:id])
  end
  
  def update
    @book= Book.find(params[:id])
    @book.update(book_params)
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    end
  end

  
  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
