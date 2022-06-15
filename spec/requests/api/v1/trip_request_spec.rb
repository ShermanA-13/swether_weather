require 'rails_helper'

RSpec.describe 'Trip request' do
  before(:each) do
    @user = User.create(
      email: 'test@gmail.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  it 'returns json response for a road trip when a valid API key is given', :vcr do
    body = {
      "origin": 'caribou,me',
      "destination": 'los angles,ca',
      "api_key": @user.api_key.to_s
    }
    headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }
    post '/api/v1/trip', headers: headers, params: JSON.generate(body)
    road_trip = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(201)
    expect(road_trip).to have_key(:data)
    expect(road_trip[:data]).to have_key(:id)
    expect(road_trip[:data]).to have_key(:type)
    expect(road_trip[:data]).to have_key(:attributes)
    expect(road_trip[:data][:type]).to eq('roadtrip')
    expect(road_trip[:data][:attributes]).to have_key(:start_city)
    expect(road_trip[:data][:attributes]).to have_key(:end_city)
    expect(road_trip[:data][:attributes]).to have_key(:travel_time)
    expect(road_trip[:data][:attributes]).to have_key(:weather_at_eta)
  end

  it 'returns json response for a road trip when a valid API key is given' do
    body = {
      "origin": 'chicago,il',
      "destination": 'denver,co',
      "api_key": @user.api_key.to_s
    }
    headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }
    post '/api/v1/trip', headers: headers, params: JSON.generate(body)

    road_trip = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(201)
    expect(road_trip).to have_key(:data)
    expect(road_trip[:data]).to have_key(:id)
    expect(road_trip[:data]).to have_key(:type)
    expect(road_trip[:data]).to have_key(:attributes)
    expect(road_trip[:data][:type]).to eq('roadtrip')
    expect(road_trip[:data][:attributes]).to have_key(:start_city)
    expect(road_trip[:data][:attributes]).to have_key(:end_city)
    expect(road_trip[:data][:attributes]).to have_key(:travel_time)
    expect(road_trip[:data][:attributes]).to have_key(:weather_at_eta)
  end

  it 'returns json response for incorrect API key', :vcr do
    body = {
      "origin": 'chicago,il',
      "destination": 'denver,co',
      "api_key": '1234'
    }
    headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }
    post '/api/v1/trip', headers: headers, params: JSON.generate(body)

    road_trip = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(401)
    expect(road_trip).to eq({ error: 'Invalid API key' })
  end

  it 'returns json response for missing API key', :vcr do
    body = {
      "origin": 'chicago,il',
      "destination": 'denver,co'
    }
    headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }
    post '/api/v1/trip', headers: headers, params: JSON.generate(body)

    road_trip = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(400)
    expect(road_trip).to eq({ error: 'Missing API key' })
  end

  it 'returns json response for missing params', :vcr do
    body = {
      "destination": 'denver,co',
      "api_key": @user.api_key.to_s
    }
    headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }
    post '/api/v1/trip', headers: headers, params: JSON.generate(body)

    road_trip = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(400)
    expect(road_trip).to eq({ error: 'Missing destination or origin locations' })
  end

  it 'returns json response for missing params', :vcr do
    body = {
      "origin": 'chicago,il',
      "api_key": @user.api_key.to_s
    }
    headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }
    post '/api/v1/trip', headers: headers, params: JSON.generate(body)

    road_trip = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(400)
    expect(road_trip).to eq({ error: 'Missing destination or origin locations' })
  end

  it 'returns travel time impossible when route cannot be mapped', :vcr do
    body = {
      "origin": 'chicago,il',
      "destination": 'tokyo,jp',
      "api_key": @user.api_key.to_s
    }
    headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }
    post '/api/v1/trip', headers: headers, params: JSON.generate(body)

    road_trip = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(201)
    expect(road_trip).to have_key(:data)
    expect(road_trip[:data]).to have_key(:id)
    expect(road_trip[:data]).to have_key(:type)
    expect(road_trip[:data]).to have_key(:attributes)
    expect(road_trip[:data][:type]).to eq('roadtrip')
    expect(road_trip[:data][:attributes]).to have_key(:start_city)
    expect(road_trip[:data][:attributes]).to have_key(:end_city)
    expect(road_trip[:data][:attributes]).to have_key(:travel_time)
    expect(road_trip[:data][:attributes][:travel_time]).to eq('Impossible route')
    expect(road_trip[:data][:attributes]).to have_key(:weather_at_eta)
  end
end
