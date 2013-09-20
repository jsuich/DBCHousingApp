class MapController < ApplicationController

  def index
    @locations = Location.all.to_a
  end


  def grablocations
    json_string = '[{"address_components":[{"long_name":"1717","short_name":"1717","types":["street_number"]},{"long_name":"North Spaulding Avenue","short_name":"N Spaulding Ave","types":["route"]},{"long_name":"Humboldt Park","short_name":"Humboldt Park","types":["neighborhood","political"]},{"long_name":"Chicago","short_name":"Chicago","types":["locality","political"]},{"long_name":"Cook","short_name":"Cook","types":["administrative_area_level_2","political"]},{"long_name":"Illinois","short_name":"IL","types":["administrative_area_level_1","political"]},{"long_name":"United States","short_name":"US","types":["country","political"]},{"long_name":"60647","short_name":"60647","types":["postal_code"]}],"formatted_address":"1717 North Spaulding Avenue, Chicago, IL 60647, USA","geometry":{"location":{"ob":41.91249,"pb":-87.70968199999999},"location_type":"ROOFTOP","viewport":{"ea":{"b":41.9111410197085,"d":41.9138389802915},"ia":{"b":-87.71103098029153,"d":-87.7083330197085}}},"partial_match":true,"types":["street_address"]}]'
    second_string = '[{"address_components":[{"long_name":"540","short_name":"540","types":["street_number"]},{"long_name":"North State Street","short_name":"N State St","types":["route"]},{"long_name":"River North","short_name":"River North","types":["neighborhood","political"]},{"long_name":"Chicago","short_name":"Chicago","types":["locality","political"]},{"long_name":"Cook","short_name":"Cook","types":["administrative_area_level_2","political"]},{"long_name":"Illinois","short_name":"IL","types":["administrative_area_level_1","political"]},{"long_name":"United States","short_name":"US","types":["country","political"]},{"long_name":"60654","short_name":"60654","types":["postal_code"]}],"formatted_address":"540 North State Street, Chicago, IL 60654, USA","geometry":{"location":{"ob":41.8919498,"pb":-87.62853259999997},"location_type":"ROOFTOP","viewport":{"ea":{"b":41.8906008197085,"d":41.8932987802915},"ia":{"b":-87.62988158029151,"d":-87.62718361970849}}},"types":["street_address"]}]'
    array = [json_string, second_string]
    # puts "WHAT DOES THIS LOOK LIKE ==================="
    # content_type :json
    render :json => array.to_json
  end

end
