class Documento < ApplicationRecord
  belongs_to :usuario
  has_one_attached :arquivo, dependent: :destroy
  has_many :relatorios, dependent: :delete_all
  has_many :notas_fiscais, dependent: :delete_all

  validates :arquivo,:titulo, presence: true
  validates :arquivo, attached: true, content_type: { in: 'text/xml', message: 'não é arquivo no formato XML' }

end
