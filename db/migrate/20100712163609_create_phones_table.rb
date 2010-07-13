class CreatePhonesTable < ActiveRecord::Migration
  def self.up
    create_table :phones, :force => true do |t|
      t.belongs_to :person
      t.string :number
    end
    add_index :phones, :person_id
  end

  def self.down
    drop_table :phones
  end
end
