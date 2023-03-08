class BooksController < ApplicationController
  def top
  end

  def index
    @books=Book.all
  end

  def new
    @books=Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def show
    @book=Book.find(params[:id])
  end
  
  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :image, :body)
  end
end
