require 'rails_helper'

RSpec.describe Usuario, type: :model do

  describe 'validações' do
    context 'é válido' do
      it 'com todos os campos válidos' do
        expect { create(:usuario) }.to change(described_class, :count).by(1)
      end
      it { should have_secure_password }
      it { should validate_presence_of(:nome) }
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:password) }

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
