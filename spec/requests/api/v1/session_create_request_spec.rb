require 'rails_helper'

describe 'the create session endpoint' do
  it 'has a happy path', :vcr do
    User.create(email:"test@test.com", password: "Password123", password_confirmation: "Password123")
    body = {"email": "test@test.com","password": "Password123"}

    post '/api/v1/sessions', params: body
    expect(response).to be_successful
    expect(response.status).to eq(200)
    user = JSON.parse(response.body, symbolize_names: true)
    expect(user).to be_a(Hash)
    expect(user[:data][:id]).to be_a(String)
    expect(user[:data][:type]).to eq("users")
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes]).to have_key(:api_key)
    expect(user[:data][:attributes][:email]).to be_a(String)
    expect(user[:data][:attributes][:api_key]).to be_a(String)
  end

  it 'has a sad path-bad password', :vcr do
    User.create(email:"test@test.com", password: "Password123", password_confirmation: "Password123")
    body = {"email": "test@test.com","password": "Password"}

    post '/api/v1/sessions', params: body
    expect(response.status).to eq(400)
  end
  it 'has a sad path-bad email', :vcr do
    User.create(email:"test@test.com", password: "Password123", password_confirmation: "Password123")
    body = {"email": "tesst.com","password": "Password123"}

    post '/api/v1/sessions', params: body
    expect(response.status).to eq(400)
  end
end
