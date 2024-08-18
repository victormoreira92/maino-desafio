class XmlProcessadorJob
  include Sidekiq::Job
  require_relative '../../config/initializers/constants'
  sidekiq_options retry: false


  def perform(arquivo_xml, id)
    processar_xml(arquivo_xml, id)
  end

  private
  def processar_xml(arquivo_xml, id)

    dados_extraídos = ExtratorDadosService.new(arquivo_xml, id).call
    DataStorageService.new(dados_extraídos).call

  end
end



