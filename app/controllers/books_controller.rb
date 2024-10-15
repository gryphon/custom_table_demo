class BooksController < ApplicationController

  before_action :get_book, except: [:index, :new, :create]

  # TIP: Remove show action from router and you will get editing form inline automatically

  # GET /books
  def index
    @books = Book.all
    @books = custom_table(@books)
  end

  # GET /books/1
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to defined?(:book_path) ? @book : @book, notice: t("notices.successfully_created")
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      redirect_to defined?(:book_path) ? @book : @book, notice: turbo_frame_request? ? nil : t("notices.successfully_updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    # @book.destroy!
    redirect_to books_url, notice: "This demo actually does not destroy records"
  end

  private

    def get_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:name, :genre_id, :released_at, :status, :featured, :pages)
    end
    
end
