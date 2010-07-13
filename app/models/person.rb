class Person < ActiveRecord::Base

  validates_presence_of :last_name, :first_name

  has_many :people_addresses_joins
  has_many :addresses, :through => :people_addresses_joins

  has_many :phones
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
