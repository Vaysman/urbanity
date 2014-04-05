class Team < ActiveRecord::Base
  belongs_to :captain, class_name: Player, foreign_key: :captain_id

  has_many :team_members
  has_many :players, through: :team_members
end
