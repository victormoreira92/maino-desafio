require 'rails_helper'

RSpec.describe "documentos/new", type: :view do
  before(:each) do
    assign(:documento, Documento.new(
      titulo: "MyString",
      usuario: nil
    ))
  end

  it "renders new documento form" do
    render

    assert_select "form[action=?][method=?]", documentos_path, "post" do

      assert_select "input[name=?]", "documento[titulo]"

      assert_select "input[name=?]", "documento[usuario_id]"
    end
  end
end
