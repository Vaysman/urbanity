class Team < ActiveRecord::Base
  belongs_to :captain, class_name: Player, foreign_key: :captain_id

  has_many :members, class_name: Player
  has_many :invitations
  has_many :invitees, class_name: Player, through: :invitations, source: :player
end

