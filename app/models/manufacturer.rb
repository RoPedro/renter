class Manufacturer < ApplicationRecord
  has_many :cars

  before_save :set_default_email

  validates :name, presence: true

  private

  def set_default_email 
    if self.email.nil? || self.email.strip.empty?
      self.email = "#{self.name.downcase.gsub(' ', '_')}@support.com"
    end
  end
end
