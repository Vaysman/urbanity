class GamePathForTeam < ActiveRecord::Base
  belongs_to :game
  belongs_to :team
  belongs_to :quest

  validates :position, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, uniqueness: { scope: [:game, :quest, :team] }
end
