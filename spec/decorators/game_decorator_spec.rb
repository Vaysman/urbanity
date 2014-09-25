require 'rails_helper'

describe GameDecorator do
  let(:game) { double(Game) }
  let(:it) { GameDecorator.new(game) }

  describe "#start" do
    it "returns nice formated date and time with icon" do
      start_time = Time.new(2014,9,17,23,05,25)
      allow(game).to receive(:start).and_return(start_time)
      expect(it.start).to match(/\<span class="glyphicon glyphicon-time"><\/span> 17\.09\.2014 23:25/)
    end
  end

  describe "#registration_end" do
    it "returns nice formated date and time with icon" do
      end_time = Time.new(2014,9,17,23,05,25)
      allow(game).to receive(:registration_end).and_return(end_time)
      expect(it.registration_end).to match(/\<span class="glyphicon glyphicon-time"><\/span> 17\.09\.2014 23:25/)
    end
  end

  describe "#registered_teams_count" do
    it "returns 5" do
      expect(it.registered_team_count).to eq(5)
    end
  end

  describe "#registered_teams_list" do
    it "returns list of 5 teams" do
      expect(it.registered_teams_list).to match(/Team 5/)
    end
  end
end
