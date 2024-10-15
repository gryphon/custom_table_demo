class AuthorsController < ApplicationController

  before_action :get_author, except: [:index, :new, :create]

  # TIP: Remove show action from router and you will get editing form inline automatically

  # GET /authors
  def index
    @authors = Author.all
    @authors = custom_table(@authors).order(:position)
  end

  # GET /authors/1
  def show
  end

  # GET /authors/new
  def new
    @author = Author.new
  end

  # GET /authors/1/edit
  def edit
  end

  # POST /authors
  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to defined?(:author_path) ? @author : @author, notice: t("notices.successfully_created")
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /authors/1
  def update
    if @author.update(author_params)
      abort @author.inspect
      redirect_to authors_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /authors/1
  def destroy
    redirect_to authors_url, notice: "This demo actually does not destroy records"
  end

  private

    def get_author
      @author = Author.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def author_params
      params.require(:author).permit(:position)
    end
    
end
