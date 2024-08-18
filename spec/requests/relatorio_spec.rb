require 'rails_helper'

RSpec.describe "Relatorios", type: :request do
  describe "GET /mostrar_relatorio" do
    it "returns http success" do
      get "/relatorio/mostrar_relatorio"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /gerar_relatorio" do
    it "returns http success" do
      get "/relatorio/gerar_relatorio"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /exportar_relatorio" do
    it "returns http success" do
      get "/relatorio/exportar_relatorio"
      expect(response).to have_http_status(:success)
    end
  end

end
