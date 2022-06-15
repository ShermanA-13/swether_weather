class BackgroundService < BaseService
  class << self
    def url
      url = 'https://api.pexels.com/v1/search?'
    end

    def get_image(location)
      response = conn(url).get do |faraday|
        faraday.params['Authorization'] = ENV['photo_api_key']
        faraday.params['query'] = location
      end
      get_json(response)
    end
  end
end
