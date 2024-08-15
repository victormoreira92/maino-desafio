class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_validation :set_perfil, on: :create

  enum perfil: {
    admin: 0,
    cliente: 1
  }

  validates :nome, :email, :password,:password_confirmation,  presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :nome, length: { minimum: 2, maximum: 75 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def set_perfil
    self.perfil = :cliente if self[:perfil].blank?
  end

end
