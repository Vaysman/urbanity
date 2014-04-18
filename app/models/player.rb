class Player < ActiveRecord::Base
  belongs_to :user

  has_many :team_members
  has_many :teams, through: :team_members
  has_many :games
end
