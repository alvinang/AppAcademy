require 'addressable/uri'
require 'json'
require 'rest-client'

class IceCreamFinder

  def current_location
    puts "What is your current address?"
    user_address = gets.chomp
    query =  {  :address => user_address,
                :sensor => false,
                :key => 'AIzaSyAPy2Fin-LijXPKk0ikbXn8dq4m7nU1Cz4'
    }
    coordinates = RestClient.get(get_coordinates("geocode", query))
    response = JSON.parse(coordinates)
    lat = response["results"].first["geometry"]["location"]["lat"].to_s
    long = response["results"].first["geometry"]["location"]["lng"].to_s
    lat_long = lat, long
    nearby_search(lat_long.join(", "))
  end


  def get_coordinates(api_type, query_values)
    url = Addressable::URI.new(
      :scheme => 'https',
      :host => 'maps.googleapis.com',
      :path => "maps/api/#{api_type}/json",
      :query_values => query_values).to_s
  end

  def nearby_search(location)
    query = {
      :sensor => false,
      :key => 'AIzaSyAPy2Fin-LijXPKk0ikbXn8dq4m7nU1Cz4',
      :location => location,
      :rankby => "distance",
      :keyword => "ice cream"
    }
    coordinates = RestClient.get(get_coordinates("place/nearbysearch", query))
    response = JSON.parse(coordinates)
    p response
    address = response["results"].first["formatted_address"]
    name = response["results"].first["name"]
    end_location = response["results"].first["geometry"]["location"]
    # puts name
    # puts address
    # puts "-----"
    lat = end_location["lat"].to_s
    long = end_location["lng"].to_s
    lat_long = lat, long
    get_directions(location, lat_long.join(","))
  end

  def get_directions(start_loc, end_loc)
    query = {
      :origin => start_loc,
      :destination => end_loc,
      :sensor => false,
      :key => 'AIzaSyAPy2Fin-LijXPKk0ikbXn8dq4m7nU1Cz4'
    }
    coordinates = RestClient.get(get_coordinates("directions", query))
    response = JSON.parse(coordinates)
    response["routes"].first["legs"].first["steps"].first.each do |step|
      p step
    end
  end

  def start_finding
    current_location
  end

end