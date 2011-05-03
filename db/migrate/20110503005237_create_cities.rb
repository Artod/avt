class CreateCities < ActiveRecord::Migration
  def self.up
    create_table :cities do |t|
      t.integer :id
      t.string :name
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end

  def self.down
    drop_table :cities
  end
end
