class RentalCar < ApplicationRecord
  belongs_to :car
  has_many :orders
  has_many :clients, through: :orders

  enum status: { available: 'available', rented: 'rented', maintenance: 'maintenance', retired: 'retired' }

  validates :license_plate, :status, presence: true
  validate :status_must_be_available, on: :create

  private

  def status_must_be_available
    errors.add(:status, "must be available to save") unless available?
  end
end
