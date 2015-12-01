class AddViewableToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :viewable, :boolean
  end
end
