class RelatorioController < ApplicationController
  before_action :set_relatorio, only: [:gerar_relatorio]

  def mostrar_relatorio
    @documento = Documento.find(params[:id])
    @relatorios = @documento.relatorios
  end

  def gerar_relatorio
    Validador::XmlValidadorService.new(@documento.arquivo.download, @documento).call

    respond_to do |format|
      if @documento.errors.empty?
        flash[:success] = t('activerecord.success.messages.relatorio')
        XmlProcessadorJob.perform_async(@documento.arquivo.download, @documento.id)
        format.html { redirect_to documentos_url }
      else
        flash[:error] = @documento.errors.full_messages
        format.html{ redirect_to documentos_url}
      end
    end
  end



  def exportar_relatorio
  end

  def relatorio_params
    params.require(:relatorio).permit(:documento_id, :nota_fiscal)
  end
end
