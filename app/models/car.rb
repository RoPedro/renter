class Car < ApplicationRecord
  after_initialize :set_default_is_archived, if: :new_record?

  belongs_to :manufacturer
  has_many :rental_cars
  
  def set_default_is_archived
    self.is_archived ||= false
  end

  validates :name, presence:true, uniqueness: true
  validates :manufacturer, presence: true
end
