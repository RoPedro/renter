class RentalCar < ApplicationRecord
  belongs_to :car
  has_many :orders
  has_many :clients, through: :orders

  enum status: { available: 'available', rented: 'rented', maintenance: 'maintenance', retired: 'retired' }

  validates :license_plate, :status, presence: true
end
