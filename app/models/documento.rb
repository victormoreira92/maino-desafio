# == Schema Information
#
# Table name: documentos
#
#  id         :bigint           not null, primary key
#  titulo     :string
#  usuario_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Documento < ApplicationRecord
  belongs_to :usuario
  has_one_attached :arquivo, dependent: :destroy

end
