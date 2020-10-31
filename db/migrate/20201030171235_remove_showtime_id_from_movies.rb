class RemoveShowtimeIdFromMovies < ActiveRecord::Migration[6.0]
  def change
    remove_column :movies, :showtime_id, :integer
  end
end
