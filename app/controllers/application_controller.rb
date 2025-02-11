class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :nao_encontrado

  def current_usuario
    @current_usuario ||= session[:usuario_id] && Usuario.find_by(id: session[:usuario_id])
  end

  def after_sign_out_path_for(usuario)
    home_path
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
