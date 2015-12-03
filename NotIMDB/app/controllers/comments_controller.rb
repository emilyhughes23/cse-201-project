class CommentsController < ApplicationController
	def create
<<<<<<< HEAD
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
    
	
=======
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.create(comment_params)
    redirect_to movie_path(@movie)
  end
  
  def comment_params
    params.require(:comment).permit(:commenter, :body, :movie_id, :created_at, :updated_at)
  end 
  

  
  def destroy
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.find(params[:id])
    @comment.destroy
    redirect_to movie_path(@movie)
  end
>>>>>>> 5b8ed2caa54b5a19e9fcb915d5b7f7cc8d228001
end
