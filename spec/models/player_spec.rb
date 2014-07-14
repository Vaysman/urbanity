require 'rails_helper'

RSpec.describe Player, :type => :model do
  it { should belong_to(:user) }
  it { should belong_to(:team) }

  it { should have_many(:games).with_foreign_key(:creator_id) }
  it { should have_many(:invitations) }

  it { should validate_presence_of(:nick) }
  it { should validate_presence_of(:user) }

  context "w/o team" do
    let(:player) { Player.new }
    describe "#own_team?" do
      it "returns nil" do
        expect(player.own_team?).to be_nil
        expect(player.own_team?(Team.new)).to be false
      end
    end
  end

  context "with team" do
    let(:team) { Team.new(captain: player) }
    let(:player) { Player.new }
    describe "#own_team?" do
      it "returns false for other team" do
        expect(player.own_team?(Team.new)).to be false
      end

      it "returns true for own team" do
        expect(player.own_team?(team)).to be true
      end
    end
  end
end
