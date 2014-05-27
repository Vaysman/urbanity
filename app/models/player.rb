class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :team

  has_many :games
  has_many :invitations

  validates :user, :nick, presence: true

  def own_team?(team = nil)
    team && team.captain == self
  end
end
