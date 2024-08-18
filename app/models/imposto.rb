=begin
  id: integer,
valor_icms: decimal,
valor_ipi: decimal,
valor_pis: decimal,
valor_cofins: decimal,
nota_fiscal_id: integer
=end
class Imposto < ApplicationRecord
  belongs_to :nota_fiscal, dependent: :destroy

  validates :valor_cofins, :valor_icms, :valor_ipi, :valor_pis, presence: true
end
