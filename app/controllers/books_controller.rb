class BooksController < ApplicationController

  def index
    @books = Book.all
    @top_books_list = Book.top_books
  end

  def show
    @book = Book.find(params[:id])
  end

end
