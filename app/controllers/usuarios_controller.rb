class UsuariosController < ApplicationController

  before_action :set_usuario, only: %i[show edit update destroy]


  def show ; end

  def new
    @usuario = Usuario.new
  end

  def edit; end

  def create
    @usuario = Usuario.new(usuario_params)

    respond_to do |format|
      if @usuario.save
        flash[:success] = t('activerecord.success.messages.create', model: Usuario.model_name.human)
        format.html { redirect_to new_session_path}
      else
        flash[:error] = @usuario.errors.full_messages
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        flash[:success] = t('activerecord.success.messages.update', model: Usuario.model_name.human)
        format.html { redirect_to usuario_url(@usuario) }
      else
        flash[:error] = @usuario.errors.full_messages
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def usuario_params
      params.require(:usuario).permit(:email, :nome, :password, :password_confirmation)
    end
end
