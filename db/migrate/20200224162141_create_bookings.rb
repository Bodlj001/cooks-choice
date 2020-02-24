class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :cook_id
      t.datetime :date
      t.string :location

      t.timestamps
    end
  end
end
