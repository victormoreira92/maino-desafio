json.extract! documento, :id, :titulo, :usuario_id, :created_at, :updated_at
json.url documento_url(documento, format: :json)
