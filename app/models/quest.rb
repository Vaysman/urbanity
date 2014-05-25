class Quest < ActiveRecord::Base
  default_scope { order(:position) }

  belongs_to :game
end
