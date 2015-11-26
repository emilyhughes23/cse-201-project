class Movie < ActiveRecord::Base
  validates_uniqueness_of :title

  def self.search(query)

    where("title like ?", "%#{query}%")
end

end
