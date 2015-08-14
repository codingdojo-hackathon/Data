class CreateSeattle911s < ActiveRecord::Migration
  def change
    create_table :seattle911s do |t|
      t.string :address
      t.datetime :datetime
      t.string :incident_number
      t.string :latitude
      t.string :longitude
      t.string :incident_type

      t.timestamps
    end
  end
end
