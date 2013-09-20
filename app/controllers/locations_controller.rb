require 'json'

class LocationsController < ApplicationController

  def new
    @location = Location.new
  end

  def create
    json_hash = JSON.parse(params[:location][:json_string])
    street_number = json_hash[0]['address_components'][0]['long_name']
    street_name = json_hash[0]['address_components'][1]['long_name']
    city = json_hash[0]['address_components'][3]['long_name']
    state = json_hash[0]['address_components'][5]['long_name']
    zip = json_hash[0]['address_components'][7]['long_name']

    location = Location.create(
                      street_address: street_number + " " + street_name,
                      city: city,
                      state: state,
                      zip: zip,
                      json_string: params[:location][:json_string]
    	)
    current_user.location_id = location.id


    redirect_to '/map'

  end

end
