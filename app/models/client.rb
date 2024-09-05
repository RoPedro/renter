class Client < ApplicationRecord
  validates :first_name, :last_name, presence: true, :format => { with: /\A[a-zA-Z]+\z/, :message => 'Only letters allowed.' }
  validates :email, presence: true, uniqueness: true
end
