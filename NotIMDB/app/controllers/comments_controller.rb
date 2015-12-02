class CommentsController < ApplicationController
	def create
                @movie = Movie.find(params[:movie_id])
                @comments = @movie.comments.create(comment_params)
                redirect_to @movie
        end
        
    def new
    @comments = Comment.new
  end
  
  private 
  def comment_params
      params.require(:comment).permit(:user, :body)
    end
    
	
end
