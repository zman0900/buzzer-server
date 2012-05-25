class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.integer :restaurant_id
      t.string :device_reg

      t.timestamps
    end
  end
end
