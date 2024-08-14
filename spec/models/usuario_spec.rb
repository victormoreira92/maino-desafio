require 'rails_helper'

RSpec.describe Usuario, type: :model do

  describe 'validações' do
    context 'é válido' do
      it 'com todos os campos válidos' do
        expect { create(:usuario) }.to change(described_class, :count).by(1)
      end

    end

    context 'não é válido' do
      it 'sem nome' do
        usuario = build(:usuario, nome: nil)
        usuario.valid?
        expect(usuario.errors[:nome]).to include('não pode ficar em branco')
      end

      it 'sem email' do
        usuario = build(:usuario, email: nil)
        usuario.valid?
        expect(usuario.errors[:email]).to include('não pode ficar em branco')
      end

      it 'nome com menos de 2 caracteres' do
        usuario = build(:usuario, nome: 'a')
        usuario.valid?
        expect(usuario.errors[:nome]).to include('é curto (mínimo: 2 caracteres)')
      end

      it 'nome com mais de 75 caracteres' do
        usuario = build(:usuario, :nome_acima_permitido)
        usuario.valid?
        expect(usuario.errors[:nome]).to include('é longo (máximo: 75 caracteres)')
      end

      it 'email com formato incorreto' do
        usuario = build(:usuario, :email_com_formato_invalido)
        usuario.valid?
        expect(usuario.errors[:email]).to include('não é válido')
      end

      it 'email já adicionado no sistema' do
        create(:usuario, email:  'email@example.com')
        usuario = build(:usuario, email: 'email@example.com')
        usuario.valid?
        expect(usuario.errors[:email]).to include('já está em uso')
      end
    end

  end
end
