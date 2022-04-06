require 'rails_helper'

RSpec.describe "QuestionTypes", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/question_types/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/question_types/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
