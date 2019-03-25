class BooksController < ApplicationController

  def index
    @books = Book.all
    @top_books_list = Book.top_books
    @worst_books_list = Book.worst_books
    @top_reviewers_list = Review.top_reviewers
    @sort_by_ascending_pages = Book.order(number_of_pages: :ASC)
    @selection = @books

  end

  def show
    @book = Book.find(params[:id])
    @author = @book.authors
  end

  def new
    @book = Book.new
  end

  def create

    @book = Book.create(book_params)
    @author = @book.authors.find_or_create_by(params[:authors_id])
    redirect_to book_path(@book)
  end

  private

  def book_params
   params.require(:book).permit(:title,:authors,:number_of_pages,:publish_year)
 end

end
