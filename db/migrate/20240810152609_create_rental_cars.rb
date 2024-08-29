class CreateRentalCars < ActiveRecord::Migration[7.1]
  def change
    create_table :rental_cars do |t|
      t.string :license_plate, null: false
      t.references :car, null: false, foreign_key: true

      t.timestamps
    end
  end
end
