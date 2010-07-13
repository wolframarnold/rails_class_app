class PeopleAddressesJoin < ActiveRecord::Base
  belongs_to :person
  belongs_to :address
end
