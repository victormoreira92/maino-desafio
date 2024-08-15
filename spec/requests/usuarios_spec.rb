require 'rails_helper'

RSpec.describe 'Usuarios', type: :request do

  let!(:usuario) { create(:usuario) }
  let!(:usuario_sem_nome) { build(:usuario, nome: nil) }
  let!(:usuario_valido) { build(:usuario) }
  let!(:usuario_sem_email) { build(:usuario, email: nil) }
  let!(:usuario_sem_senha) { build(:usuario, password: nil) }
  let!(:usuario_sem_confirmacao_senha) { build(:usuario, password_confirmation: nil)}

  describe 'GET #index' do
    before do
      usuario
    end
    context 'quaundo acessar o index' do
      it 'listar todos os usuarios' do
        get usuarios_path
        expect(response).to have_http_status(:success)
        expect(response.body).to include(usuario.nome)
      end
    end
  end

  describe 'GET #show' do
    context 'quando acesso é possível' do
      it 'mostrar dados do usuario' do
        get usuario_path(usuario)
        expect(response).to have_http_status(:success)
      end
    end

    context 'quando acesso não é possivel' do
      it 'usuário não existe' do
        get usuario_path(-2)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(flash[:error]).to eq("Dado não encontrado")
      end
    end
  end

  describe "Get #new" do
    context 'quando acessar novo usuário' do
      it 'mostrar página usuario#new' do
        get new_usuario_path
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "GET #edit" do
    context 'quando acessar edição de usuário' do
      it "mostrar página usuario#edit" do
        get edit_usuario_url(usuario)
        expect(response).to be_successful
      end
    end

  end

  describe 'POST #create' do
    context 'com parametros válidos' do
      it 'com todos os atributos' do
        post usuarios_url, params: { usuario: { nome: usuario_valido.nome, email: usuario_valido.email,
                                     password: usuario_valido.password, password_confirmation: usuario_valido.password_confirmation } }

        expect(response).to have_http_status(:success)
        expect(Usuario.count).to eq(1)
        expect(flash[:success]).to eq(I18n.t("activerecord.success.messages.create", model: Usuario.model_name.human))
      end

      it "redirects to the created usuario" do
        post usuarios_url, params: { usuario: valid_attributes }
        expect(response).to redirect_to(usuario_url(Usuario.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Usuario" do
        expect {
          post usuarios_url, params: { usuario: invalid_attributes }
        }.to change(Usuario, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post usuarios_url, params: { usuario: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context 'com parametros válidos' do
      login_user
      it 'com todos os atributos' do
        patch usuarios_url(usuario), params: { usuario: { nome: usuario_valido.nome, email: usuario_valido.email,
                                                          password: usuario_valido.password, password_confirmation: usuario_valido.password_confirmation } }

        expect(response).to have_http_status(:success)
        expect(Usuario.count).to eq(1)
        expect(flash[:success]).to eq(I18n.t("activerecord.success.messages.update", model: Usuario.model_name.human))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        usuario = Usuario.create! valid_attributes
        patch usuario_url(usuario), params: { usuario: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested usuario" do
      usuario = Usuario.create! valid_attributes
      expect {
        delete usuario_url(usuario)
      }.to change(Usuario, :count).by(-1)
    end

    it "redirects to the usuarios list" do
      usuario = Usuario.create! valid_attributes
      delete usuario_url(usuario)
      expect(response).to redirect_to(usuarios_url)
    end
  end
end
