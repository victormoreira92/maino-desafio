# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(usuario)

    if usuario.admin?
      #Usuario
      can :manage, Usuario, :all
      can :manage, Documento, :all
    else
      #Usuario
      can %i[update read], Usuario, id: usuario.id
      cannot :index, Usuario

      #Documento
      can %i[read update destroy], Documento, usuario_id: usuario.id
    end
  end
end
