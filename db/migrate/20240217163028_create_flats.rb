class CreateFlats < ActiveRecord::Migration[7.1]
  def change
    create_table :flats do |t|
      t.string :name
      t.string :location
      t.decimal :price_per_night
      t.text :description
      t.integer :number_of_guests
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
