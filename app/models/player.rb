class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :team

  has_many :games
end
