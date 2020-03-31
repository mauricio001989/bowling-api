require 'rails_helper'

describe BowlingGame do
  context 'when create a bowling game' do
    subject(:bowling_game) { build_stubbed(:bowling_game) }

    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:bowling_lane) }
  end
end
