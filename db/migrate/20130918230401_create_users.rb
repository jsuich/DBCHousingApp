class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :cohort_name
      t.integer :cohort_id
      t.string :email
      t.string :phone_number
      t.belongs_to :location

      t.timestamps
    end
  end
end
