=begin
  id: integer,
nome: string,
ncm: string,
cfop: string,
unidade_comercializada: string,
quantidade: integer,
valor_unitario: decimal,
nota_fiscal_id: id
=end
class Produto < ApplicationRecord
  belongs_to :nota_fiscal
  validates :nome,:valor_unitario, :cfop, :ncm, :quantidade, :unidade_comercializada, presence: true
end
