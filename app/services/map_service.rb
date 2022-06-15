class MapService < BaseService
  class << self
    def url
      url = 'http://www.mapquestapi.com/'
    end

    def get_coordinates(location)
      response = conn(url).get('geocoding/v1/address?') do |faraday|
        faraday.params['location'] = location
        faraday.params['key'] = ENV['map_api_key']
      end
      get_json(response)
    end

    def get_trip(from, to)
      response = conn(url).get('/directions/v2/route?') do |faraday|
        faraday.params['from'] = from
        faraday.params['to'] = to
        faraday.params['key'] = ENV['map_api_key']
      end
      get_json(response)
    end
  end
end
