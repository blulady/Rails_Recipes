require 'rails_helper'

RSpec.describe "Webs", type: :request do
  describe "GET /booststrap" do
    it "returns http success" do
      get "/web/booststrap"
      expect(response).to have_http_status(:success)
    end
  end

end
