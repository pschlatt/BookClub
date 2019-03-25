class BooksController < ApplicationController



  def index
    @books = Book.all
    @top_books_list = Book.top_books
    @worst_books_list = Book.worst_books
    @top_reviewers_list = Review.top_reviewers
    @sort_by_ascending_pages = Book.sort_by_ascending_pages

    if params.has_key?("sort")
      if params[:sort] == "average rating in ascending order"
        @books = Book.left_outer_joins(:reviews).group(:id).order("avg(rating) ASC NULLS LAST")
      elsif params[:sort] == "average rating in descending order"
        @books = Book.left_outer_joins(:reviews).group(:id).order("avg(rating) DESC NULLS LAST")
      elsif params[:sort] == "number of pages in ascending order"
        @books = Book.order(:number_of_pages)
      elsif params[:sort] == "number of pages in descending order"
        @books = Book.order(number_of_pages: :DESC)
      elsif params[:sort] == "number of reviews in ascending order"
        @books = Book.left_outer_joins(:reviews).group(:id).order("count(reviews)")
      elsif params[:sort] == "number of reviews in descending order"
        @books = Book.left_outer_joins(:reviews).group(:id).order("count(reviews) DESC")
      end

    end

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
