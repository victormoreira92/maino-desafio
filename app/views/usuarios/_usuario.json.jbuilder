json.extract! usuario, :id, :email, :nome, :perfil, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
