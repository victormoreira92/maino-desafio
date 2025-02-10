# == Schema Information
#
# Table name: usuarios
#
#  id              :bigint           not null, primary key
#  nome            :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Usuario < ApplicationRecord
  has_secure_password

  validates :nome, :email, :password,  presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

end
