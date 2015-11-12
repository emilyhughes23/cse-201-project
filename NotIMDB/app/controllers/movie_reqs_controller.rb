class MovieReqsController < ApplicationController
  before_action :set_movie_req, only: [:show, :edit, :update, :destroy]

  # GET /movie_reqs
  # GET /movie_reqs.json
  def index
    @movie_reqs = MovieReq.all
  end

  # GET /movie_reqs/1
  # GET /movie_reqs/1.json
  def show
  end

  # GET /movie_reqs/new
  def new
    @movie_req = MovieReq.new
  end

  # GET /movie_reqs/1/edit
  def edit
  end

  # POST /movie_reqs
  # POST /movie_reqs.json
  def create
    @movie_req = MovieReq.new(movie_req_params)

    respond_to do |format|
      if @movie_req.save
        format.html { redirect_to @movie_req, notice: 'Movie req was successfully created.' }
        format.json { render :show, status: :created, location: @movie_req }
      else
        format.html { render :new }
        format.json { render json: @movie_req.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movie_reqs/1
  # PATCH/PUT /movie_reqs/1.json
  def update
    respond_to do |format|
      if @movie_req.update(movie_req_params)
        format.html { redirect_to @movie_req, notice: 'Movie req was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie_req }
      else
        format.html { render :edit }
        format.json { render json: @movie_req.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movie_reqs/1
  # DELETE /movie_reqs/1.json
  def destroy
    @movie_req.destroy
    respond_to do |format|
      format.html { redirect_to movie_reqs_url, notice: 'Movie req was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie_req
      @movie_req = MovieReq.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_req_params
      params.require(:movie_req).permit(:title, :genre, :director, :actor1, :actor2, :actor3, :releaseyr, :rating, :description)
    end
end
