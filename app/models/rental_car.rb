class RentalCar < ApplicationRecord
  belongs_to :car

  validates :license_plate, presence: true
end
