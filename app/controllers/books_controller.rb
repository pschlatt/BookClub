class BooksController < ApplicationController

  def index
    @books = Book.all
    @top_books_list = Book.top_books
    @worst_books_list = Book.worst_books
  end

  def show
    @book = Book.find(params[:id])
  end

end
