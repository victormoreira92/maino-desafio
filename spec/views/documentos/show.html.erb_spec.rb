require 'rails_helper'

RSpec.describe "documentos/show", type: :view do
  before(:each) do
    assign(:documento, Documento.create!(
      titulo: "Titulo",
      usuario: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Titulo/)
    expect(rendered).to match(//)
  end
end
