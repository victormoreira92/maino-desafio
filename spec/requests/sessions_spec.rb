require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /entrar" do
    it "returns http success" do
      get "/sessions/entrar"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /cadastrar" do
    it "returns http success" do
      get "/sessions/cadastrar"
      expect(response).to have_http_status(:success)
    end
  end

end
