class RemoveShowTimeIdFromMovies < ActiveRecord::Migration[6.0]
  def change
    remove_column :movies, :show_time_id, :integer
  end
end
