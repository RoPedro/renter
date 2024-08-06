class AddIsArchivedToCars < ActiveRecord::Migration[7.1]
  def change
    add_column :cars, :is_archived, :boolean
  end
end
