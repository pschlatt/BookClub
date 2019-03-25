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
  end

  def new
    @book = Book.new
  end

end
