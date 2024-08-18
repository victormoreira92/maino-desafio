
DADOS_NotaFiscal = {
  localizacao: %w[NFe infNFe ide],
  atributos: {
    serie: 'serie',
    numero_nota_fiscal: 'nNF',
    data_emissao: 'dhEmi'
  }
}.freeze

DADOS_Imposto ={
  localizacao: %w[NFe infNFe total ICMSTot],
  atributos: {
    valor_icms: 'vICMS',
    valor_ipi: 'vIPI',
    valor_pis: 'vPIS',
    valor_cofins: 'vCOFINS'
  }
}.freeze

DADOS_Produto ={
  localizacao: %w[NFe infNFe det],
  atributos: {
    nome:'xProd',
    valor_unitario: 'vUnCom',
    cfop: 'CFOP',
    ncm: 'NCM',
    quantidade: 'qCom',
    unidade_comercializada: 'uCom'
  }
}.freeze

DADOS_ValorTotal = {
  localizacao: %w[NFe infNFe total ICMSTot],
  atributos: {
    valor_produtos: 'vProd' ,
    valor_imposto: 'vTotTrib'
  }
}.freeze

DADOS_DadoEminente = {
  localizacao_dadoeminente: %w[NFe infNFe emit],
  localizacao_enderdadoeminente: %w[NFe infNFe emit enderEmit],
  atributos_dadoeminente: {
    cnpj_eminente: 'CNPJ',
    nome_eminente: 'xNome'
  },
  atributos_enderdadoeminente: {
    logadouro_eminente:'xLgr',
    complemento_eminente: 'nro',
    bairro_eminente: 'xBairro',
    municipio_eminente: 'cMun',
    uf_eminente: 'UF',
    cep_eminente: 'CEP',
    pais_eminente: 'xPais',
    fone: 'fone'
  }
}.freeze
DADOS_DadoDestinatario = {
  localizacao_dadodestinatario: %w[NFe infNFe dest],
  localizacao_enderdadodestinatario: %w[NFe infNFe dest enderDest],
  atributos_dadodestinatario: {
    cnpj_destinatario: 'CNPJ',
    nome_destinatario: 'xNome'
  },
  atributos_enderdadodestinatario: {
    logadouro_destinatario:'xLgr',
    complemento_destinatario: 'nro',
    bairro_destinatario: 'xBairro',
    municipio_destinatario: 'cMun',
    uf_destinatario: 'UF',
    cep_destinatario: 'CEP',
    pais_destinatario: 'xPais',
  }
}.freeze
