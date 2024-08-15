require 'rails_helper'

RSpec.describe Documento, type: :model do
  describe 'validações' do
    context 'é válido' do
      it 'com todos os campos' do
        expect { create(:documento, :com_arquivo_xml) }.to change(described_class, :count).by(1)
      end
    end

    context 'não é válido' do
      it 'com formato de arquivo diferente de XML' do
        documento = build(:documento, :com_outro_documento)
        documento.valid?
        expect(documento.errors[:arquivo]).to include('não é arquivo no formato XML')
      end

      it 'sem titulo' do
        documento = build(:documento,:com_arquivo_xml, titulo: nil )
        documento.valid?
        expect(documento.errors[:titulo]).to include('não pode ficar em branco')
      end

      it 'sem arquivo' do
        documento = build(:documento)
        documento.valid?
        expect(documento.errors[:arquivo]).to include('não pode ficar em branco')
      end

      it 'sem usuario' do
        documento = build(:documento, :com_arquivo_xml, usuario: nil )
        documento.valid?
        expect(documento.errors[:usuario]).to include('é obrigatório(a)')
      end
    end
  end
end
