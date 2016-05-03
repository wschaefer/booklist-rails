class BooksController < ApplicationController
  def index
    @flagged_books = Book.where(flag: true).order(:author_last, :author_first, :title)
    @unflagged_books = Book.where(flag: false).order(:author_last, :author_first, :title)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: Book.all}
    end
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    book = Book.create(params[:book].permit(:title, :author_first, :author_last, :flag))

    respond_to do |format|
      format.html { redirect_to books_path }
      format.json { render json: book}
    end
  end

  def update
    book = Book.find(params[:id])
    book.update_attributes(params[:book].permit(:title, :author_first, :author_last, :flag))
    redirect_to books_path
  end
end
