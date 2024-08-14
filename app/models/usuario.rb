class Usuario < ApplicationRecord

  enum perfil: {
    admin: 0,
    cliente: 1
  }
end
