require "rails_helper"

RSpec.describe SkillsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/skills").to route_to("skills#index")
    end
  end
end
