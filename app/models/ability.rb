# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(usuario)

    if usuario.admin?
      #Usuario
      can :manage, Usuario, :all

    else
      #Usuario
      can :update, Usuario, id: usuario.id
      can :read, Usuario, id: usuario.id
      cannot :index, Usuario
    end
  end
end
