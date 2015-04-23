class BooksController < ApplicationController
  def index
    @books = Book.all.order(:author_last, :author_first, :title)
  end

  def new
    @book = Book.new
  end

  def create
    Book.create(params[:book].permit(:title, :author_first, :author_last))
    redirect_to books_path
  end
end
