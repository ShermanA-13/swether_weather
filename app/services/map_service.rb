class MapService < BaseService
  class << self
    def get_coordinates(location)
      response = conn(url).get('geocoding/v1/address?') do |faraday|
        faraday.params['location'] = location
        faraday.params['key'] = ENV['map_api_key']
      end
      get_json(response)
    end

    def url
      url = 'http://www.mapquestapi.com/'
    end
  end
end
