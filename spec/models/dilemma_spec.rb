require 'rails_helper'

describe Dilemma, type: :model do
  it { is_expected.to belong_to :user }

  context 'dilemma will not validate if' do
    it '2 images are not uploaded' do
      dilemma = Dilemma.new(option1: File.new(Rails.root + "spec/fixtures/Gok1.jpg"))
      expect(dilemma.errors[:option2].size).to eq(1)
      expect(dilemma).not_to be_valid
    end
  end
end
