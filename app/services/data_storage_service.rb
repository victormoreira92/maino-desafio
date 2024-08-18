# frozen_string_literal: true

class DataStorageService
  def initialize(hash_dados)
    @hash_dados = hash_dados
    @documento_id = hash_dados.delete("documento_id")
  end

  def call
    salvar_dados
    puts "foi"
  end
  private
  def salvar_dados
    @hash_dados.keys.each do |key|
      send("salvar_#{key}", @hash_dados["#{key}"])
    end

  end

  def salvar_notafiscal(hash)
    id = NotaFiscal.create!(
      serie: hash[:serie],
      numero_nota_fiscal: hash[:numero_nota_fiscal],
      data_emissao: Time.new(hash[:data_emissao]),
      documento_id: @documento_id
    ).id
    @hash_dados[:notafiscal_id] = id

    Relatorio.create!(
      documento_id: @documento_id
    )

  end

  def salvar_produto(hash)
    hash.each do |key, value|
      Produto.create!(
        nome: value[:nome],
       ncm: value[:ncm],
       cfop: value[:cfop],
       unidade_comercializada: value[:unidade_comercializada],
       quantidade: value[:quantidade].to_i,
       valor_unitario: value[:valor_unitario].to_d,
      nota_fiscal_id: @hash_dados[:notafiscal_id].to_i
      )
    end
  end

  def salvar_dadoeminente(hash)
    DadoEminente.create!(
      cnpj_eminente: hash[:cnpj_eminente],
    nome_eminente: hash[:nome_eminente],
    logadouro_eminente: hash[:logadouro_eminente],
    complemento_eminente: hash[:complemento_eminente],
    bairro_eminente: hash[:bairro_eminente],
    municipio_eminente: hash[:municipio_eminente],
    uf_eminente: hash[:uf_eminente],
    cep_eminente: hash[:cep_eminente],
    pais_eminente: hash[:pais_eminente],
    fone: hash[:fone],
    nota_fiscal_id: @hash_dados[:notafiscal_id].to_i
    )
  end

  def salvar_dadodestinatario(hash)
    DadoDestinatario.create!(
      nome_destinatario: hash[:nome_destinatario],
      logadouro_destinatario: hash[:logadouro_destinatario],
      complemento_destinatario: hash[:complemento_destinatario],
      bairro_destinatario: hash[:bairro_destinatario],
      municipio_destinatario: hash[:municipio_destinatario],
      uf_destinatario: hash[:uf_destinatario],
      cep_destinatario: hash[:cep_destinatario],
      pais_destinatario: hash[:pais_destinatario],
      cnpj_destinatario: hash[:cnpj_destinatario],
      nota_fiscal_id: @hash_dados[:notafiscal_id].to_i
    )

  end

  def salvar_valortotal(hash)
    ValorTotal.create!(
      valor_produtos: hash[:valor_produtos].to_d,
      valor_imposto: hash[:valor_imposto].to_d,
      nota_fiscal_id:  @hash_dados[:notafiscal_id].to_i
    )
  end

  def salvar_imposto(hash)
    Imposto.create!(
      valor_pis: hash[:valor_pis].to_d,
      valor_icms: hash[:valor_icms].to_d,
      valor_ipi: hash[:valor_ipi].to_d,
      valor_cofins: hash[:valor_cofins].to_d,
      nota_fiscal_id: @hash_dados[:notafiscal_id].to_i
    )
  end
end

