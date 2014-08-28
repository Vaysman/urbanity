require 'rails_helper'

RSpec.describe Team, :type => :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:captain) }

  it { should belong_to(:captain) }
  it { should have_many(:members) }
  it { should have_many(:invitations) }
  it { should have_many(:invitees) }
end
