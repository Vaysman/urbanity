require 'rails_helper'

RSpec.describe Answer, :type => :model do
  it { should belong_to(:quest) }

  it { should validate_presence_of(:text) }
  it { should validate_numericality_of(:points).only_integer.is_greater_than(0) }
end
