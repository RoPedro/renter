class RentalCar < ApplicationRecord
  belongs_to :car

  private

  validates :license_plate, presence: true
end
