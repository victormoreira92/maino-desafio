class SessionsController < ApplicationController

  def new
    @usuario = Usuario.new
  end


  def create
    binding.pry
    @usuario = Usuario.find_by(email: usuario_params[:email])

    if @usuario && @usuario.authenticate(usuario_params[:password])
      session[:usuario_id] = @usuario.id
      flash[:success] = t('activerecord.success.messages.login')
      redirect_to dashboard_index_path
    else
      flash[:error] = t('activerecord.errors.messages.login_invalid')
      redirect_to new_session_path
    end
  end

  def destroy
    session = nil
    redirect_to home_index_path
  end

  def usuario_params
    params.require(:usuario).permit(:email, :password)
  end
end
