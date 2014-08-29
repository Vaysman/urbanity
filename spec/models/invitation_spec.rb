require 'rails_helper'

RSpec.describe Invitation, :type => :model do
  it { should validate_presence_of(:team) }
  it { should validate_presence_of(:player) }

  it { should belong_to(:player) }
  it { should belong_to(:team) }
end
