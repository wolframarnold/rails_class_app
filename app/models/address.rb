class Address < ActiveRecord::Base
  validates_presence_of :house_number, :street, :city, :zip
  validates_numericality_of :house_number
  validates_length_of :state, :is => 2

  before_validation :set_country_if_missing

  has_many :people_addresses_joins
  has_many :people, :through => :people_addresses_joins

  private

  def set_country_if_missing
    self.country = "USA" unless self.country.present?
  end
end
