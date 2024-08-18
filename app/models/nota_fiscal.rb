=begin
Número de Série (serie) => string,
Número da Nota Fiscal (numero_nota_fiscal) => string,
Data e Hora de Emissão (data_emissao) => datetime
=end

class NotaFiscal < ApplicationRecord
  belongs_to :documento
  has_many :produtos, dependent: :delete_all
  has_one :dado_eminente, dependent: :delete
  has_one :dado_destinatario, dependent: :delete
  has_one :imposto, dependent: :delete
  has_one :valor_total, dependent: :delete

  validates :serie, :data_emissao, :numero_nota_fiscal, presence: true

end
