class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :first_name, :limit => 16
      t.string :last_name

      t.timestamps # creates columns "created_at", "updated_at"
    end
  end

  def self.down
    drop_table :people
  end
end
