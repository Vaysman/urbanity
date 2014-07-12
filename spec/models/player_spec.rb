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
        player.own_team?.should be_nil
        player.own_team?(Team.new).should be_false:w
      end
    end
  end

  context "with team" do
    let(:team) { Team.new }
    let(:player) { Player.new(team: team) }
    describe "#own_team?" do
      it "returns false for other team" do
        player.own_team?(Team.new).should be_false
      end

      it "returns true for own team" do
        player.own_team?(team).should be_true
      end
    end
  end
end
