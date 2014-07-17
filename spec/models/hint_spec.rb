require 'rails_helper'

RSpec.describe Hint, :type => :model do
  it { should belong_to(:quest) }

  it { should validate_presence_of(:text) }
  it { should validate_numericality_of(:delay).only_integer.is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:position).only_integer.is_greater_than_or_equal_to(0) }
  it { should validate_uniqueness_of(:position).scoped_to(:quest_id) }
end
