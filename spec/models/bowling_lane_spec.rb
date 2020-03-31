require 'rails_helper'

describe BowlingLane do
  context 'when create a bowling lanes' do
    subject(:bowling_lane) { build_stubbed(:bowling_lane) }

    it { is_expected.to validate_presence_of(:length) }
  end
end
