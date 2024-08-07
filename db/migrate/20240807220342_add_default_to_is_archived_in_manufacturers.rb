class AddDefaultToIsArchivedInManufacturers < ActiveRecord::Migration[7.1]
  def change
    change_column_default :manufacturers, :is_archived, from: nil, to: false
  end
end
