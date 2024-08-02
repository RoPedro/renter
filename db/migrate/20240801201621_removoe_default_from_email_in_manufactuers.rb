class RemovoeDefaultFromEmailInManufactuers < ActiveRecord::Migration[7.1]
  def up
    change_column_default :manufacturers, :email, from: '', to: nil
  end

  def down
    change_column_default :manufacturers, :email, from: nil, to: ''
  end
end
