require 'rails_helper'

RSpec.describe Quest, :type => :model do
  it { belong_to(:game) }
  it { have_many(:answers) }
  it { have_many(:hints) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:game) }
  it { should validate_numericality_of(:position).only_integer.is_greater_than(0) }
  it { should validate_uniqueness_of(:position).scoped_to(:game_id) }

  describe "#swap_position" do
    it "swap position of two quest" do
      quest1 = Quest.create!(position: 1)
      quest2 = Quest.create!(position: 2)
      quest1.swap_position(quest2)
      expect(quest1.position).to eq(2)
      expect(quest2.position).to eq(1)
    end
  end
end
