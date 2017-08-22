require 'rails_helper'

RSpec.describe "Odots", type: :request do
  describe "GET /odots" do
    it "works! (now write some real specs)" do
      get odots_path
      expect(response).to have_http_status(200)
    end
  end
end
