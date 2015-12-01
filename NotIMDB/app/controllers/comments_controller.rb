class CommentsController < ApplicationController
	def create
                @movie = Movie.find(params[:id])
                @comment = @movie.comments.create!(params[:comment])
                redirect_to @movie
        end
end
