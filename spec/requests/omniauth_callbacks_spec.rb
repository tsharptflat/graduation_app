require 'rails_helper'

RSpec.describe "OmniauthCallbacks", type: :request do
  describe "GET /steam" do
    it "returns http success" do
      get "/omniauth_callbacks/steam"
      expect(response).to have_http_status(:success)
    end
  end
end
