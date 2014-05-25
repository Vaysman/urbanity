class Game < ActiveRecord::Base
  belongs_to :creator, class_name: Player
  has_many :quests

  validates :creator, :name, :start, :registration_end, presence: true
  validates :max_number_of_teams, numericality: { only_integer: true, greater_than: 1 }
  validates :min_number_of_teams, numericality: { only_integer: true, greater_than: 0 }
end
