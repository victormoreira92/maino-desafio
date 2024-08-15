require 'rails_helper'

RSpec.describe "documentos/edit", type: :view do
  let(:documento) {
    Documento.create!(
      titulo: "MyString",
      usuario: nil
    )
  }

  before(:each) do
    assign(:documento, documento)
  end

  it "renders the edit documento form" do
    render

    assert_select "form[action=?][method=?]", documento_path(documento), "post" do

      assert_select "input[name=?]", "documento[titulo]"

      assert_select "input[name=?]", "documento[usuario_id]"
    end
  end
end
