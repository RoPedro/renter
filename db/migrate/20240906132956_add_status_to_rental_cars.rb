class AddStatusToRentalCars < ActiveRecord::Migration[7.1]
  def change
    add_column :rental_cars, :status, :string, default: 'available' 
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
