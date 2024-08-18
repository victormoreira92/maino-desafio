=begin
  id: integer,
 valor_produtos: decimal,
 valor_imposto: decimal,
 nota_fiscal_id: integer
=end

class ValorTotal < ApplicationRecord
  belongs_to :nota_fiscal
  validates :valor_imposto, :valor_produtos, presence: true
end
