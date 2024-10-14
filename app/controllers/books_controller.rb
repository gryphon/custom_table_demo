class BooksController < ApplicationController

  # load_and_authorize_resource :book

  # TIP: Remove show action from router and you will get editing form inline automatically

  # GET /books
  def index
    @books = Book.all
    @books = custom_table(@books)
  end

  # GET /books/1
  def show
    @book = Book.find(params[:id])
  end

  # GET /books/new
  def new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  def create
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
    @book.destroy!
    redirect_to books_url, notice: t("notices.successfully_destroyed")
  end

  private

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:name)
    end
    
end
