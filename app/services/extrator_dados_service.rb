  class ExtratorDadosService
    require 'ox'

    def initialize(arquivo_xml, id)
      @arquivo_xml = arquivo_xml
      @documento_id = id
      @doc = Ox.parse(%{<?xml?>#{@arquivo_xml}})
      @hash_dados = Hash.new
      @lista_constantes = %w[NotaFiscal Produto Imposto ValorTotal DadoDestinatario DadoEminente]
    end

    def call
      dados_xml
    end

    private
    def dados_xml
      @hash_dados["documento_id"] = @documento_id
      @lista_constantes.each do |constant|
        @hash_dados[constant.downcase] = extrair_dado_tags(constant)
      end

      @hash_dados
    end

    def extrair_dado_tags(nome_constante)


      dado = @doc
      temp = Hash.new

      if nome_constante.eql?("DadoDestinatario") || nome_constante.eql?("DadoEminente")

        "DADOS_#{nome_constante}".constantize["localizacao_#{nome_constante.downcase}".to_sym].each do |localizador|
          dado = dado.send(localizador)
        end
        "DADOS_#{nome_constante}".constantize["atributos_#{nome_constante.downcase}".to_sym].each do |atributos, value|
          temp[atributos] = dado.send(value).text
        end

        dado = @doc

        "DADOS_#{nome_constante}".constantize["localizacao_ender#{nome_constante.downcase}".to_sym].each do |localizador|
          dado = dado.send(localizador)
        end

        "DADOS_#{nome_constante}".constantize["atributos_ender#{nome_constante.downcase}".to_sym].each do |atributos, value|
          temp[atributos] = dado.send(value).text
        end
      elsif nome_constante.eql?("Produto")
        dado = @doc
        "DADOS_#{nome_constante}".constantize[:localizacao].each do |localizacao|
          dado = dado.send(localizacao)
        end


        dado = @doc
        dado.NFe.infNFe.locate('det').each_with_index do |produto_nota, index|
          prod = Hash.new
          "DADOS_#{nome_constante}".constantize[:atributos].each do |atributos, value|
            prod[atributos] = produto_nota.prod.send(value).text
          end
          temp[index + 1] = prod
        end
      else
        "DADOS_#{nome_constante}".constantize[:localizacao].each do |localizador|
          dado = dado.send(localizador)
        end


        "DADOS_#{nome_constante}".constantize[:atributos].each do |atributos, value|
          temp[atributos] = dado.send(value).text
        end
      end
      temp

    end
  end


