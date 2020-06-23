require 'rails_helper'

RSpec.describe "Purchases", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/purchase/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /done" do
    it "returns http success" do
      get "/purchase/done"
      expect(response).to have_http_status(:success)
    end
  end

end
