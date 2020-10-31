class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :movie_name
      t.string :description
      t.string :actor_name
      t.string :director_name
      t.string :movie_language
      t.timestamps
    end
  end
end
