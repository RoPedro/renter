class Order < ApplicationRecord
  belongs_to :client
  belongs_to :rental_car
end
