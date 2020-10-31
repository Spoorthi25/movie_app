class RemoveDateFromMovies < ActiveRecord::Migration[6.0]
  def change
    remove_column :movies, :date, :date
  end
end
