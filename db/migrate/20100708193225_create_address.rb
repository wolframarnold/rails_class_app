class CreateAddress < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.integer :house_number
      t.string :street,:city,:state,:zip,:country
    end
  end

  def self.down
    drop_table :addresses
  end
end
