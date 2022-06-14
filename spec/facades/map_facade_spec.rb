require 'rails_helper'
RSpec.describe MapFacade do
  it '.get_coords', :vcr do
    coords = MapFacade.get_coords('Denver,Co')

    expect(coords).to eq({ lat: 39.738453, lng: -104.984853 })
  end
end
