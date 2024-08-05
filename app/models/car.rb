class Car < ApplicationRecord
  belongs_to :manufacturer

  validates :name, presence:true
  validates :manufacturer, presence: true
end
