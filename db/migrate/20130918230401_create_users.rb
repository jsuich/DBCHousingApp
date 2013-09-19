class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :cohort_name, null: false
      t.integer :cohort_id
      t.string :email, null: false
      t.string :phone_number
      t.belongs_to :location

      t.timestamps
    end
  end
end
