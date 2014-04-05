class Team < ActiveRecord::Base
  belongs_to :captain, class_name: User, foreign_key: :captain_id

  has_many :team_members
  has_many :members, through: :team_members, class_name: User, foreign_key: :user_id
end
