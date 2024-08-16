class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :nao_encontrado
  rescue_from CanCan::AccessDenied, with: :acesso_negado
  def after_sign_in_path_for(usuario)
    session[:usuario_id] = usuario.id
    root_path
  end

  def after_sign_out_path_for(usuario)
    home_path
  end

  def current_ability
    @current_ability ||= Ability.new(current_usuario)
  end

  private
  def nao_encontrado
    flash[:error] = "Dado não encontrado"
    redirect_to root_path, status: :unprocessable_entity
  end
  def acesso_negado
    redirect_to '/403'
  end
end
