class ApplicationController < ActionController::Base
  def after_sign_in_path_for(usuario)
    session[:usuario_id] = usuario.id
    root_path
  end

  def after_sign_out_path_for(usuario)
    home_path
  end
end
