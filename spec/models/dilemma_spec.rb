require 'rails_helper'

describe Dilemma, type: :model do
  it { is_expected.to belong_to :user }


end
