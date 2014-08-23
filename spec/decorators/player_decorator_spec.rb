require 'rails_helper'

describe PlayerDecorator do
  describe "#full_name" do
    it "returns Nemo if first_name and last_name are blank" do
      player = double
      allow(player).to receive(:first_name) { "" }
      allow(player).to receive(:last_name) { "" }

      it = PlayerDecorator.new(player)

      expect(it.full_name).to eq("Nemo")
    end

    it "returns concatination first_name + " " + last_name if they are not blank" do
      player = double
      allow(player).to receive(:first_name) { "first" }
      allow(player).to receive(:last_name) { "last" }

      it = PlayerDecorator.new(player)

      expect(it.full_name).to eq("first last")
    end
  end

  describe "#nick_name" do
    it "returns Anonymous if nick is blank" do
      player = double
      allow(player).to receive(:nick) { "" }

      it = PlayerDecorator.new(player)

      expect(it.nick_name).to eq("Anonymous")
    end

    it "returns nick if nick is not blank" do
      player = double
      allow(player).to receive(:nick) { "nick" }

      it = PlayerDecorator.new(player)

      expect(it.nick_name).to eq("nick")
    end
  end

  describe "#bio" do
    it "returns 'There is no such information' if bio is blank" do
      player = double
      allow(player).to receive(:bio) { "" }

      it = PlayerDecorator.new(player)

      expect(it.bio).to eq("There is no such information")
    end

    it "returns bio if bio is not blank" do
      player = double
      allow(player).to receive(:bio) { "bio" }

      it = PlayerDecorator.new(player)

      expect(it.bio).to eq("bio")
    end
  end

  describe "#email" do
    it "delegates email to User object" do
      user = double("user")
      player = double("user")
      allow(player).to receive(:user) { user }
      allow(user).to receive(:email) { mail }
    end
  end
end
