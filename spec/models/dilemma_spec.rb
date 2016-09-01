require 'rails_helper'

describe Dilemma, type: :model do
  it { is_expected.to belong_to :user }

  it 'does not create dilemma if user does not add two photos' do
    dilemma = Dilemma.create(occasion: "Stroll in park")
    expect(dilemma).not_to be_a Dilemma
  end
end
