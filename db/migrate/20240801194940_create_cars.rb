class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :engine 
      t.string :transmission
      t.integer :horsepower, null: true
      t.date :released_at
      t.references :manufacturer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
