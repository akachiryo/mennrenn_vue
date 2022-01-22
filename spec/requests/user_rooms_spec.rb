require 'rails_helper'

RSpec.describe "UserRooms", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/user_rooms/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/user_rooms/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
