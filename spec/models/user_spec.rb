require 'rails_helper'

describe User, type: :model do
  it { is_expected.to have_many :dilemmas }
  it { is_expected.to have_many :voted_dilemmas }
  describe 'Dilemma' do
    let!(:user){ User.create! email: 'test@test.com', password: '123123', name: 'test' }
    let!(:dilemma_params){ {occasion: 'wedding'} }
    subject(:dilemma) { user.dilemmas.create!(dilemma_params) }
    it 'creates a dilemma' do
      expect(dilemma).to be_a Dilemma
    end
    it 'creates a dilemma associated with a specific user' do
      expect(dilemma.user).to eq user
    end
  end
end
