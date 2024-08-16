require 'rails_helper'

RSpec.describe NotaFiscal, type: :model do
  describe 'Validações' do
    context 'quando é válido' do
      it 'nota fiscal com todos os dados' do
        expect { create(:nota_fiscal) }.to change(described_class, :count).by(1)
      end
    end
    context 'quando não é válido' do
      %w[ serie nNF dhEmi emit dest].each do |atributo|
        it "#{I18n.t("activerecord.attributes.nota_fiscal.#{atributo}")+"(#{atributo})"} faltando" do
          nota_fiscal = build(:nota_fiscal)
          nota_fiscal.send("#{atributo}=", '')
          nota_fiscal.valid?
          expect(nota_fiscal.errors[atributo]).to include('não pode ficar em branco')
        end
      end
    end
  end
end
