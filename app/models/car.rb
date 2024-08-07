class Car < ApplicationRecord
  after_initialize :set_default_is_archived, if: :new_record?

  belongs_to :manufacturer
  
  def set_default_is_archived
    self.is_archived ||= false
  end

  validates :name, presence:true
  validates :manufacturer, presence: true
end
