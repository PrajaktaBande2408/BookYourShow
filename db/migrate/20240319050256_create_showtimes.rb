class CreateShowtimes < ActiveRecord::Migration[6.1]
  def change
    create_table :showtimes do |t|
      t.integer :movie_id
      t.datetime :start_time
      t.datetime :end_time
      t.integer :available_seats

      t.timestamps
    end
  end
end
