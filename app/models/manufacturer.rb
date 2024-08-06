class Manufacturer < ApplicationRecord
  scope :active, -> { where(is_archived: false) }
  scope :archived, -> { where(is_archived: true) }
  
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
