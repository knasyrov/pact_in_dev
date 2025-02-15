require 'rails_helper'

RSpec.describe "/skills", type: :request do
  let(:valid_attributes) {
    {
      name: 'test'
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Skill.create! valid_attributes
      get skills_url, as: :json
      expect(response).to be_successful
    end
  end
end
