class MapFacade
  class << self
    def get_coords(location)
      json = MapService.get_coordinates(location)
      json[:results][0][:locations][0][:latLng]
    end
  end
end
