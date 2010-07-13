class AddPeopleAddressesJoinsTable < ActiveRecord::Migration
  def self.up
    create_table :people_addresses_joins, :force => true do |t|
      # Note: in migrations, you can use belongs_to :perspon instead of integer :person_id
      # These are equivalent
      t.belongs_to :person, :address
    end
    add_index :people_addresses_joins, [:person_id, :address_id]

    remove_column :addresses, :person_id
  end

  def self.down
    drop_table :people_addresses_joins

    add_column :addresses, :person_id, :integer
  end
end
