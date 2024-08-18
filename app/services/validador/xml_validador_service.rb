require 'ox'

module Validador
  class XmlValidadorService

    def initialize(arquivo,documento)
      @arquivo = arquivo
      @resp = nil
      @documento = documento
    end

    def call
      validar_xml
    end

    def validar_xml

      if @arquivo.empty?
        @documento.errors.add(:arquivo, ' vazio')
      end

      doc = Ox.parse(%{<?xml?>#{@arquivo}})
      doc = doc.locate('NFe')

      if doc.empty?
        @documento.errors.add(:arquivo, 'com formato inválido.')
      end
    end
  end
end
