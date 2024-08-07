class AddDefaultToIsArchivedInCars < ActiveRecord::Migration[7.1]
  def change
    change_column_default :cars, :is_archived, from: nil, to: false
  end
end
