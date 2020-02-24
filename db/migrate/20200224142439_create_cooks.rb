class CreateCooks < ActiveRecord::Migration[6.0]
  def change
    create_table :cooks do |t|
      t.string :name
      t.text :bio
      t.string :cuisine
      t.integer :rating
      t.integer :price

      t.timestamps
    end
  end
end
