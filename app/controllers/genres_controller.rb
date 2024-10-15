class GenresController < ApplicationController

  before_action :get_genre, except: [:index, :new, :create]

  # TIP: Remove show action from router and you will get editing form inline automatically

  # GET /genres
  def index
    @genres = Genre.all
    @genres = custom_table(@genres)
  end

  # GET /genres/1
  def show
  end

  # GET /genres/new
  def new
    @genre = Genre.new
  end

  # GET /genres/1/edit
  def edit
  end

  # POST /genres
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to defined?(:genre_path) ? @genre : @genre, notice: t("notices.successfully_created")
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /genres/1
  def update
    if @genre.update(genre_params)
      redirect_to defined?(:genre_path) ? @genre : @genre, notice: turbo_frame_request? ? nil : t("notices.successfully_updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /genres/1
  def destroy
    # @genre.destroy!
    redirect_to genres_url, notice: "This demo actually does not destroy records"
  end

  private

    def get_genre
      @genre = Genre.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def genre_params
      params.require(:genre).permit(:name, :parent_id)
    end
    
end
