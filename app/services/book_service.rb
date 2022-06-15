class BookService < BaseService
  class << self
    def url
      url = 'http://openlibrary.org/search.json'
    end

    def get_books(location)
      response = conn(url).get do |faraday|
        faraday.params['q'] = location
      end
      get_json(response)
    end
  end
end
