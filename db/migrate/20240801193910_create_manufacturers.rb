class CreateManufacturers < ActiveRecord::Migration[7.1]
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.string :email, default: ''
      t.boolean :is_archived

      t.timestamps
    end
  end
end
