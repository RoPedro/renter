class Client < ApplicationRecord
  has_many :orders
  has_many :rental_cars, through: :orders
  
  validates :first_name, :last_name, presence: true, :format => { with: /\A[a-zA-Z]+\z/, :message => 'Only letters allowed.' }
  validates :email, presence: true, uniqueness: true
end
