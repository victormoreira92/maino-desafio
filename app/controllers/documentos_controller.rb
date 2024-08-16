class DocumentosController < ApplicationController
  load_and_authorize_resource
  #before_action :set_documento, only: %i[ show edit update destroy ]

  # GET /documentos or /documentos.json
  def index
    @documentos = Documento.all
  end

  # GET /documentos/1 or /documentos/1.json
  def show
  end

  # GET /documentos/new
  def new
    @documento = Documento.new
  end

  # GET /documentos/1/edit
  def edit
  end

  # POST /documentos or /documentos.json
  def create
    @documento = Documento.new(documento_params)

    respond_to do |format|
      if @documento.save
        flash[:success] = t('activerecord.success.messages.create', model: Documento.model_name.human)
        format.html { redirect_to documento_url(@documento)}
      else
        flash[:error] = @documento.errors.full_messages
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documentos/1 or /documentos/1.json
  def update
    respond_to do |format|
      if @documento.update(documento_params)
        flash[:success] = t('activerecord.success.messages.update', model: Documento.model_name.human)
        format.html { redirect_to documento_url(@documento)}
      else
        flash[:error] = @documento.errors.full_messages
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documentos/1 or /documentos/1.json
  def destroy
    @documento.destroy

    respond_to do |format|
      flash[:success] = t('activerecord.success.messages.destroy', model: Documento.model_name.human)
      format.html { redirect_to documentos_url}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_documento
      @documento = Documento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def documento_params
      params.require(:documento).permit(:titulo, :usuario_id, :arquivo)
    end
end
