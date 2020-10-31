class AddDateToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :date, :date

  end
end

