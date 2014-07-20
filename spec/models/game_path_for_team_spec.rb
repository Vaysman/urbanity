require 'rails_helper'

RSpec.describe GamePathForTeam, :type => :model do
  it { should belong_to(:game) }
  it { should belong_to(:team) }
  it { should belong_to(:quest) }

  it { should validate_numericality_of(:position).only_integer.is_greater_than_or_equal_to(0) }
  it { should validate_uniqueness_of(:position).scoped_to(:game_id, :quest_id, :team_id) }
end
