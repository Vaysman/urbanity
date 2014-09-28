require 'rails_helper'

describe TeamDecorator do
  include Rails.application.routes.url_helpers
  
  let(:team) { FactoryGirl.create(:team) }
  let(:it) { TeamDecorator.new(team) }

  describe "#size" do
    it "returns number of team members" do
      allow(team).to receive(:members).and_return(Array.new(1))

      expect(it.size).to eq(1)
    end
  end

  describe "#actions_for" do
    let(:player) { double(Player) }

    context "player own team" do
    end

    context "player doesn't own team" do
      it "returns html fragmet with show link" do
        it = FactoryGirl.create(:team).decorate
        allow(player).to receive("own_team?").and_return(false)
        expect(it.actions_for(player)).to match(/>Show<\/a>/)
      end
    end
  end
end
