class GameState < ActiveRecord::Base
  belongs_to :game
  belongs_to :team
  belongs_to :quest
  belongs_to :hint
end
