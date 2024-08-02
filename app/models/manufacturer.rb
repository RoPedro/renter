class Manufacturer < ApplicationRecord
  before_save :set_default_email

  private

  def set_default_email 
    if self.email.nil? || self.email.strip.empty?
      self.email = "#{self.name.downcase.gsub(' ', '_')}@support.com"
    end
  end
end
