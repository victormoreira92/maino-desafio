require 'rails_helper'

RSpec.describe "usuarios/show", type: :view do
  before(:each) do
    assign(:usuario, Usuario.create!(
      email: "Email",
      nome: "Nome",
      perfil: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/2/)
  end
end
