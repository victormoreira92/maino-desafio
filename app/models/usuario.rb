# == Schema Information
#
# Table name: usuarios
#
#  id         :bigint           not null, primary key
#  nome       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Usuario < ApplicationRecord
  has_secure_password
  
  validates :nome, :email, :password,:password_confirmation,  presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :nome, length: { minimum: 2, maximum: 75 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

end
