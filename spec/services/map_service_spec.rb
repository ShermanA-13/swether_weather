require 'rails_helper'

RSpec.describe 'Map Service' do
  it 'returns a faraday response', :vcr do
    url = 'http://www.mapquestapi.com/'
    connection = MapService.conn(url)
    expect(connection).to be_a(Faraday::Connection)
  end

  it 'returns longitude and lattitude', :vcr do
    get_location = MapService.get_coordinates('Denver,CO')
    expect(get_location).to be_a Hash
    expect(get_location[:results]).to be_a Array
    expect(get_location[:results][0]).to be_a Hash
    expect(get_location[:results][0][:locations]).to be_a Array
    expect(get_location[:results][0][:locations][0]).to be_a Hash
    expect(get_location[:results][0][:locations][0][:latLng]).to have_key(:lat)
    expect(get_location[:results][0][:locations][0][:latLng]).to have_key(:lng)
  end

  it 'gets directions from mapquest given two inputs' do
    from = 'chicago,il'
    to = 'denver,co'

    response = MapService.get_trip(from, to)
    expect(response).to be_a Hash
    expect(response).to have_key(:route)
    expect(response[:route]).to have_key(:time)
    expect(response[:route]).to have_key(:locations)
  end
end
