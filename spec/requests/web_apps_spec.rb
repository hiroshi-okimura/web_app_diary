require 'rails_helper'

RSpec.describe "WebApps", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/web_apps/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/web_apps/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /todayapp" do
    it "returns http success" do
      get "/web_apps/todayapp"
      expect(response).to have_http_status(:success)
    end
  end

end
