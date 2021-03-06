class MapController < ApplicationController

  def index
    if current_user
      @locations = Location.all.to_a
    else
      redirect_to '/'
    end
  end


  def grablocations
    if current_user
      # Location.purge_empty_locations
      empty_array = []
      all_locations = Location.all

      all_locations.each do |location|

        cohorts = location.grab_cohorts

        empty_array << [buildHtml(location), location.json_string, cohorts.to_json]
      end

      # all_locations = Location.all
      # json_strings = []
      # all_locations.each {|location| json_strings << location.json_string}
      render :json => empty_array.to_json
    else
      redirect_to '/'
    end
  end

end
