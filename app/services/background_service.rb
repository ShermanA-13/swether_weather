class BackgroundService
  class << self
    def conn
      url = 'https://api.pexels.com/v1/search?'
      Faraday.new(url: url, headers: { "Authorization": ENV['photo_api_key'] })
    end

    def get_image(location)
      response = conn.get do |faraday|
        faraday.params['query'] = location
      end
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
