require 'rails_helper'
RSpec.describe 'users request' do
  it 'returns json' do
    data = {
      "email": 'test@gmail.com',
      "password": 'password',
      "password_confirmation": 'password'
    }
    headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }
    post '/api/v1/users', headers: headers, params: JSON.generate(data)
    user = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(user[:data][:id]).to be_an Integer
    expect(user[:data][:attributes][:email]).to eq('test@gmail.com')
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes]).to have_key(:api_key)
    expect(user[:data][:attributes]).to_not have_key(:password)
    expect(user[:data][:attributes]).to_not have_key(:password_confirmation)
  end

  it 'returns 404 when ivalid attributes' do
    data = {
      "email": 'test@gmail.com',
      "password": 'passwo',
      "password_confirmation": 'password'
    }
    headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }
    post '/api/v1/users', headers: headers, params: JSON.generate(data)

    expect(response.status).to eq(404)
  end

  it 'returns 404 when ivalid attributes' do
    data = {
      "email": 'test@gmail.com',
      "password": 'password',
      "password_confirmation": 'assword'
    }
    headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }
    post '/api/v1/users', headers: headers, params: JSON.generate(data)

    expect(response.status).to eq(404)
  end

  it 'returns 404 with invalid attributes' do
    data = {
      "email": '',
      "password_confirmation": 'password'
    }
    headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }
    post '/api/v1/users', headers: headers, params: JSON.generate(data)

    expect(response.status).to eq(404)
  end
end
