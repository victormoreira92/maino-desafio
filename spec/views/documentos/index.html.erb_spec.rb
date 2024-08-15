require 'rails_helper'

RSpec.describe "documentos/index", type: :view do
  before(:each) do
    assign(:documentos, [
      Documento.create!(
        titulo: "Titulo",
        usuario: nil
      ),
      Documento.create!(
        titulo: "Titulo",
        usuario: nil
      )
    ])
  end

  it "renders a list of documentos" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Titulo".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
