class Team < ActiveRecord::Base
  belongs_to :captain, class_name: Player, foreign_key: :captain_id

  has_many :members, class_name: Player
end
