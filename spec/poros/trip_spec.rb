require 'rails_helper'

describe 'trip poro' do
  it 'exists and has attributes', :vcr do
    origin = 'chicago,il'
    destination = 'denver,co'
    json = MapService.get_trip(origin, destination)
    roadtrip = MapFacade.trip_info(origin, destination)

    expect(roadtrip).to be_a Trip
    expect(roadtrip.origin).to be_a String
    expect(roadtrip.destination).to be_a String
    expect(roadtrip.time_in_days).to be_a Integer
    expect(roadtrip.time_in_hours).to be_a Integer
    expect(roadtrip.readable_time).to be_a String
    expect(roadtrip.over_two_days?).to eq(true).or eq(false)
  end
end
