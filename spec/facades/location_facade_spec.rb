require 'rails_helper'
RSpec.describe LocationFacade do
  it '.get_coords' do
    coords = LocationFacade.get_coords('Denver,Co')

    expect(coords).to eq({ lat: 39.738453, lng: -104.984853 })
  end
end
