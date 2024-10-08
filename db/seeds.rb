# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Creating some manufacturers
Manufacturer.create!([
  { name: "Porsche", email: "porsche@support.com", is_archived: false },
  { name: "Ferrari", email: "ferrari@support.com", is_archived: false },
  { name: "Rolls Royce", email: "", is_archived: false }
])

# Creating some cars
Car.create!([
  { name: "911 GT3 RS", 
    engine: "4.0L Six-Cylinder Boxer",
    transmission: "Automatic",
    horsepower: 518,
    released_at: Date.today,
    manufacturer: Manufacturer.find_by(name: "Porsche") },
  { name: "458",
    engine: "4.5L V8",
    transmission: "Automatic",
    horsepower: 562,
    released_at: Date.today,
    manufacturer: Manufacturer.find_by(name: "Ferrari") },
  { name: "Phantom",
    engine: "6.7L V12 Twin-turbocharged",
    transmission: "Automatic",
    horsepower: 563,
    released_at: Date.today,
    manufacturer: Manufacturer.find_by(name: "Rolls Royce") }
])

# Creating some rentals
RentalCar.create!([
  { license_plate: "AAA1B22", car: Car.find_by(name: "911 GT3 RS") },
  { license_plate: "BBB2C33", car: Car.find_by(name: "911 GT3 RS") },
  { license_plate: "CCC3D44", car: Car.find_by(name: "458") },
  { license_plate: "DDD4E55", car: Car.find_by(name: "Phantom") }
])

Client.create!([
  { first_name: "Peter", last_name: "Parker", email: "peterparker@brooklyn.com" },
  { first_name: "Clark", last_name: "Kent", email: "clarkkent@krypton.com" },
  { first_name: "Mikasa", last_name: "Ackerman", email: "mikasa_arckerman@paradis.com" },
  { first_name: "Amy", last_name: "Rose", email: "amyrose@greenhill.com" }
])

Order.create!([
  { rental_car: RentalCar.find_by(license_plate: "AAA1B22"), client: Client.find_by(first_name: "Peter"), status: :pending, return_until: Date.today },
  { rental_car: RentalCar.find_by(license_plate: "BBB2C33"), client: Client.find_by(first_name: "Clark"), status: :pending, return_until: Date.today },
  { rental_car: RentalCar.find_by(license_plate: "CCC3D44"), client: Client.find_by(first_name: "Mikasa"), status: :pending, return_until: Date.today },
  { rental_car: RentalCar.find_by(license_plate: "DDD4E55"), client: Client.find_by(first_name: "Amy"), status: :returned, return_until: Date.today, returned_at: Date.today }
])

Order.where(status: :pending).each do |order|
  order.rental_car.rented!
end