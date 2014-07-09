require 'rails_helper'

RSpec.describe Player, :type => :model do
  it { should belong_to(:user) }
  it { should belong_to(:team) }

  it { should have_many(:games).with_foreign_key(:creator_id) }
  it { should have_many(:invitations) }

  it { should validate_presence_of(:nick) }
  it { should validate_presence_of(:user) }

  describe "#own_team?" do
    # TODO
  end
end
