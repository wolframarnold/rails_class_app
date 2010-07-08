class AddPersonIdToAddressesTable < ActiveRecord::Migration
  def self.up
    add_column :addresses, :person_id, :integer
    add_index :addresses, :person_id
  end

  def self.down
    remove_column :addresses, :person_id
  end
end
