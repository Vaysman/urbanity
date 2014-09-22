require 'rails_helper'

describe TeamDecorator do
  let(:team) { double(Team) }
  let(:it) { TeamDecorator.new(team) }

  describe "#size" do
    it "returns number of team members" do
      allow(team).to receive(:members).and_return(Array.new(1))

      expect(it.size).to eq(1)
    end
  end
end
