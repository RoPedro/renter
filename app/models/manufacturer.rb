class Manufacturer < ApplicationRecord
  after_initialize :set_default_is_archived, if: :new_record?
  
  has_many :cars

  before_save :set_default_email

  validates :name, presence: true

  private

  def set_default_email 
    if self.email.nil? || self.email.strip.empty?
      self.email = "#{self.name.downcase.gsub(' ', '_')}@support.com"
    end
  end

  def set_default_is_archived
    self.is_archived ||= false
  end
end
