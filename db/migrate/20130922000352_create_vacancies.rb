class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
    	t.string :contact_name
		t.string :contact_email
	    t.string :contact_phone_number
      	t.string :gravatar

      	t.string :url # => External site w info ab vacancy, e.g. craigslist

	    t.belongs_to :location
	    t.timestamps
    end
  end
end
