class Order < ApplicationRecord
  belongs_to :client
  belongs_to :rental_car
  validate :rental_must_be_available, on: create 

  enum status: { pending: 'pending', returned: 'returned' }

  private

  def rental_must_be_available
    unless rental_car.status == 'available'
      errors.add(:rental_car, "must be available to save")
    end
  end
end
