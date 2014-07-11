require 'rails_helper'

RSpec.describe Game, :type => :model do
  it { should belong_to(:creator).class_name("Player") }
  it { should have_many(:quests) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:start) }
  it { should validate_presence_of(:registration_end) }
  it { should validate_presence_of(:creator) }
  it { should validate_numericality_of(:max_number_of_teams).only_integer.is_greater_than(1) }
  it { should validate_numericality_of(:min_number_of_teams).only_integer.is_greater_than(0) }
end
