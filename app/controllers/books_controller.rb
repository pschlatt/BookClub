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
    if @book.save!
      author_params[:authors].split(',').each do |author_param|
        @book.authors.find_or_create_by(name: author_param.strip)
      end

    end
    redirect_to book_path(@book)
  end

  private

  def book_params
   params.require(:book).permit(:title,:number_of_pages,:publish_year)
 end

  def author_params
    params.permit(:authors)
  end

end
