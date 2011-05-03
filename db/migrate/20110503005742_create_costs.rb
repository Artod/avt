class CreateCosts < ActiveRecord::Migration
  def self.up
    create_table :costs do |t|
      t.integer :id
      t.integer :origin_id
      t.integer :destination_id
      t.date :depart_date
      t.date :return_date
      t.integer :value

      t.timestamps
    end
	
	add_index [:origin_id, :destination_id, :depart_date, :return_date], :unique => true
  end

  def self.down
    drop_table :costs
  end
end
