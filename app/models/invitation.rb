class Invitation < ActiveRecord::Base
  belongs_to :player
  belongs_to :team

  validates :player, :team, presence: true
end
