require 'rails_helper'

RSpec.describe GameLog, :type => :model do
  it { should belong_to(:quest) }
  it { should belong_to(:game) }
  it { should belong_to(:team) }

  it { should validate_presence_of(:action) }
end
