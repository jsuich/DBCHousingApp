class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string  :name
      t.string  :street_address, null: false
      t.string  :city, null: false
      t.string  :state, null: false
      t.integer :zip, null: false
      t.text    :json_string, null: false

      t.timestamps
    end
  end
end
