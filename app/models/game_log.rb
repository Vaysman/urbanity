class GameLog < ActiveRecord::Base
  belongs_to :game
  belongs_to :team
  belongs_to :quest

  validates :action, presence: true
end
