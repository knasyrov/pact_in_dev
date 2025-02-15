require 'rails_helper'

RSpec.describe "/interests", type: :request do
  let(:valid_attributes) {
    { 
      name: 'test' 
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Interest.create! valid_attributes
      get interests_url, as: :json
      expect(response).to be_successful
    end
  end
end
