require 'rails_helper'
RSpec.describe MapFacade do
  it '.get_coords', :vcr do
    coords = MapFacade.get_coords('Denver,Co')

    expect(coords).to eq({ lat: 39.738453, lng: -104.984853 })
  end

  it '.get_trip', :vcr do
    origin = 'chicago,il'
    destination = 'denver,co'
    json = MapService.get_trip(origin, destination)
    roadtrip = MapFacade.trip_info(origin, destination)

    expect(roadtrip).to be_a Trip
  end
end
