require "rails_helper"

RSpec.describe InterestsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/interests").to route_to("interests#index")
    end
  end
end
