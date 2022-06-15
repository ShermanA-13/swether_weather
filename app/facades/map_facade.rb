class MapFacade
  class << self
    def get_coords(location)
      json = MapService.get_coordinates(location)
      json[:results][0][:locations][0][:latLng]
    end

    def trip_info(from, to)
      json = MapService.get_trip(from, to)
      Trip.new(json, from, to)
    end
  end
end
