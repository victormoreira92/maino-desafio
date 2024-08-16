class NotaFiscal < ApplicationRecord
  belongs_to :documento

  validates :serie, :nNF, :dhEmi, :emit,
            :dest, presence: true
end
