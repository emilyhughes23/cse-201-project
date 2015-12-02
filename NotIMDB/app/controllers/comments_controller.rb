class CommentsController < ApplicationController
	def create
                @movie = Movie.find(params[:id])
                @comment = @movie.comments.create!(params[:comment])
                @comments = Comment.find(:all, :order => 'created_at DESC', :limit => 10)
                redirect_to @movie
        end
        
    def new
    @comment = Comment.new
  end
end
