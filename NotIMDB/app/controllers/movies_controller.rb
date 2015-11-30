class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  # GET /movies
  # GET /movies.json
  def index
  
  orderBy = ""

	if(params[:sort] == "titleAsc")
		orderBy = "title asc"
	elsif (params[:sort] == "titleDesc")
		orderBy = "title desc"
	elsif (params[:sort] == "rateAsc")
		orderBy = "rating asc"
	elsif (params[:sort] == "rateDesc")
		orderBy = "rating desc"
	end
   
	if (params[:filter_genre] == "All" && params[:filter_rating] == "")
			@movies = Movie.all.order(orderBy)	
	elsif (params[:filter_genre] && params[:filter_rating] == "")
		@movies = Movie.filterGenre(params[:filter_genre]).order(orderBy)		
	elsif (params[:filter_rating] && params[:filter_genre] == "All")
		@movies = Movie.filterRating(params[:filter_rating]).order(orderBy)	
	elsif (params[:filter_genre] && params[:filter_rating])
		@movies = Movie.filter(params[:filter_genre], params[:filter_rating]).order(orderBy)	
	elsif params[:search]
      @movies = Movie.search(params[:search]).order(orderBy)
	else 
	@movies = Movie.all
	end
	
end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @tweet = Tweet.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
  end
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
    @tweet = Movie.find(params[:id])
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    
      if @movie.save
<<<<<<< HEAD
        redirect_to index_url
        flash[:success] = "Movie was successfully created."
       
=======
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
>>>>>>> 243b2b182eaaf225f25bad2e853883c5711bd9b6
      else
       render 'new'
       
      end
    end
 

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :genre, :director, :actor1, :actor2, :actor3, :releaseyr, :rating, :description)
    end
end
