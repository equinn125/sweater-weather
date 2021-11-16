require 'rails_helper'

describe 'the user create endpoint' do
  it 'creates a user-happy path', :vcr do
    body = {"email": "test@test.com",
      "password": "Password123",
      "password_confirmation": "Password123"}
    post '/api/v1/users', params: body
      expect(response).to be_successful
      expect(response.status).to eq(201)
      user = JSON.parse(response.body, symbolize_names: true)
      expect(user).to be_a(Hash)
      expect(user[:data][:id]).to be_a(String)
      expect(user[:data][:type]).to eq("user")
      expect(user[:data]).to have_key(:attributes)
      expect(user[:data][:attributes]).to have_key(:email)
      expect(user[:data][:attributes]).to have_key(:api_key)
      expect(user[:data][:attributes][:email]).to be_a(String)
      expect(user[:data][:attributes][:api_key]).to be_a(String)
  end

  it 'has a sad path for missing field', :vcr do
    body = {"email": "test@test.com",
      "password": "Password123",
      "password_confirmation": " "}
    post '/api/v1/users', params: body
    expect(response.status).to eq(400)
  end

  it 'has a sad path if user is already registered', :vcr do
    User.create(email:"test@test.com", password: "Password123", password_confirmation: "Password123")
    body = {"email": "test@test.com",
      "password": "Password123",
      "password_confirmation": "Password123"}
      post '/api/v1/users', params: body
      expect(response.status).to eq(400)
  end

  it 'has a sad path if the password and password confirmation do not match', :vcr do
    body = {"email": "test@test.com",
      "password": "Password123",
      "password_confirmation": "Password1"}
    post '/api/v1/users', params: body
    expect(response.status).to eq(400)
  end
end
