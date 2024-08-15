module RequestMacros
  def login_user
    # Before each test, create and login the user
    before(:each) do
      usuario = FactoryBot.create(:usuario)
      post usuario_session_path, params: { usuario: { email: usuario.email, password: usuario.password} }
    end
  end
end
