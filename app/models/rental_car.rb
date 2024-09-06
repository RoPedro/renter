class RentalCar < ApplicationRecord
  belongs_to :car
  has_many :orders
  has_many :clients, through: :orders

  private

  validates :license_plate, presence: true
end
