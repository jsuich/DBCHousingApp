require 'json'

class LocationsController < ApplicationController

  def new
    if current_user
      @location = Location.new
    else
      redirect_to '/'
    end
  end

  def create
    json_hash = JSON.parse(params[:location][:json_string])
    name = params[:location][:name]
    street_number = json_hash[0]['address_components'][0]['long_name']
    street_name = json_hash[0]['address_components'][1]['long_name']
    city = json_hash[0]['address_components'][3]['long_name']
    state = json_hash[0]['address_components'][5]['long_name']
    zip = json_hash[0]['address_components'][7]['long_name']

    location = Location.find_or_create_by(street_address: street_number + " " + street_name)
    location.update_attributes(
                      name: name,
                      city: city,
                      state: state,
                      zip: zip,
                      json_string: params[:location][:json_string]
    	)
    current_user.location_id = location.id
    current_user.save

    redirect_to '/map'

  end

end
