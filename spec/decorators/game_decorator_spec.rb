require 'rails_helper'

describe GameDecorator do
  describe "#start" do
    it "returns nice formated date and time with icon" do
      game = double(Game)
      start_time = Time.new(2014,9,17,23,05,25)
      allow(game).to receive(:start).and_return(start_time)
      it = GameDecorator.new(game)
      expect(it.start).to match(/\<span\s+class\s*=\s*"glyphicon glyphicon-time"> 17\.09\.2014 23:05<\/span>/)
    end
  end

  describe "#registration_end" do
    it "returns nice formated date and time with icon" do
      game = double(Game)
      end_time = Time.new(2014,9,17,23,05,25)
      allow(game).to receive(:registration_end).and_return(end_time)
      it = GameDecorator.new(game)
      expect(it.registration_end).to match(/\<span\s+class\s*=\s*"glyphicon glyphicon-time"> 17\.09\.2014 23:05<\/span>/)
    end
  end
end
