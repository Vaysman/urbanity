class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :team

  has_many :games

  def own_team?(team = nil)
    team && team.captain == self
  end
end
