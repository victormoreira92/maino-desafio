class Documento < ApplicationRecord
  belongs_to :usuario
  has_one_attached :arquivo

  validates :arquivo,:titulo, presence: true
  validates :arquivo, attached: true, content_type: { in: 'text/xml', message: 'não é arquivo no formato XML' }

end
