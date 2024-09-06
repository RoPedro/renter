class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :client, null: false, foreign_key: true
      t.references :rental_car, null: false, foreign_key: true
      t.string :status
      t.datetime :return_until
      t.datetime :returned_at, null: true

      t.timestamps
    end
  end
end
