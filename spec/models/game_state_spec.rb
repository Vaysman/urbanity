require 'rails_helper'

RSpec.describe GameState, :type => :model do
  it { should belong_to(:game) }
  it { should belong_to(:team) }
  it { should belong_to(:quest) }
  it { should belong_to(:hint) }
end
