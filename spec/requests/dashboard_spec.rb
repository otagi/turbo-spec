require 'rails_helper'

describe "Dashboard" do
  describe "GET /show" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
    end
  end
end
