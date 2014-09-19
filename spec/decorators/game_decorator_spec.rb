require 'rails_helper'

describe GameDecorator do
  let(:game) { double(Game) }
  let(:it) { GameDecorator.new(game) }

  describe "#start" do
    it "returns nice formated date and time with icon" do
      start_time = Time.new(2014,9,17,23,05,25)
      allow(game).to receive(:start).and_return(start_time)
      expect(it.start).to match(/\<span\s+class\s*=\s*"glyphicon glyphicon-time"> 17\.09\.2014 23:05<\/span>/)
    end
  end

  describe "#registration_end" do
    it "returns nice formated date and time with icon" do
      end_time = Time.new(2014,9,17,23,05,25)
      allow(game).to receive(:registration_end).and_return(end_time)
      expect(it.registration_end).to match(/\<span\s+class\s*=\s*"glyphicon glyphicon-time"> 17\.09\.2014 23:05<\/span>/)
    end
  end

  describe "#registred_teams_count" do
    it "returns 5" do
      expect(it.registred_team_count).to eq(5)
    end
  end
end
