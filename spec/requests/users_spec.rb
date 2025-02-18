require 'rails_helper'

RSpec.describe "/users", type: :request do
  describe "GET /index" do
    it "renders a successful response" do
      User.create!(
        email: 'admin@example.com',
        name: 'Name',
        patronymic: 'middle_name',
        surname: 'last',
        gender: 'male',
        age: 20,
        country: 'Russia',
        nationality: 'Uzbek'
      )
      get users_url, headers: {}, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      user = User.create!(
        email: 'admin@example.com',
        name: 'Name',
        patronymic: 'middle_name',
        surname: 'last',
        gender: 'male',
        age: 20,
        country: 'Russia',
        nationality: 'Uzbek'
      )
      get user_url(user.id), as: :json
      expect(response).to be_successful
    end
  end
end
