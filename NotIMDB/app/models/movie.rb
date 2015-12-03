class Movie < ActiveRecord::Base
  validates_uniqueness_of :title
  
  has_many :comments
  
  def self.search(query)
  
    where("title like ?", "%#{query}%") 
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