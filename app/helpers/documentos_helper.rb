module DocumentosHelper
  def documento_tem_relatorio(relatorio)
    if relatorio.nil?
      content_tag(:span, 'Success', class: 'badge badge-success')
    else
      content_tag(:span, 'Error', class: 'badge badge-danger')
    end
  end

  def retorno_do_link(documento)
    if documento.relatorios.empty?
      link_to 'Gerar Relatório',gerar_relatorio_documento_path(documento), class: "btn btn-primary"
    else
      link_to 'Ver Relatório',mostrar_relatorio_documento_path(documento), class: "btn btn-success"
    end
  end
end
