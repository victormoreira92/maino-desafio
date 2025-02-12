class ApplicationController < ActionController::Base
  helper_method :usuario_sign_in

  def current_usuario
    @current_usuario ||= session[:usuario_id] && Usuario.find_by(id: session[:usuario_id])
  end

  def after_sign_out_path_for(usuario)
    home_path
  end

  def usuario_sign_in
    unless current_usuario
      flash[:error] = t('activerecord.errors.messages.usuario_not_sign_in')
      redirect_to new_session_path
    end
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
