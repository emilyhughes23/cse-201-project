class Movie < ActiveRecord::Base
  validates_uniqueness_of :title
  
<<<<<<< HEAD
  has_many :comments
=======
  has_many :comments, :dependent => :destroy
>>>>>>> 5b8ed2caa54b5a19e9fcb915d5b7f7cc8d228001
  
  def self.search(query)
  
		where("title like ?", "%#{query}%") 
	end
	
	def self.searchFiltBoth(query, selGenre, selRating)
  
		where("title like ?", "%#{query}%").where("genre = :genre and rating  = :rating", {genre: selGenre, rating: selRating}) 
	end
	
	def self.searchFiltGenre(query, selGenre)
  
		where("title like ?", "%#{query}%").where("genre = :genre", {genre: selGenre}) 
	end
	
	def self.searchFiltRate(query, selRating)
  
		where("title like ?", "%#{query}%").where("rating  = :rating", {rating: selRating}) 
	end

	def self.filter(selGenre, selRating)
	  
		where("genre = :genre and rating  = :rating", {genre: selGenre, rating: selRating}) 

	end

	def self.filterGenre(selGenre)
	  
		where("genre = :genre", {genre: selGenre}) 

	end

	def self.filterRating(selRating)
	  
		where("rating  = :rating", {rating: selRating}) 

	end


end