class Hint < ActiveRecord::Base
  belongs_to :quest

  validates :text, presence: true
  validates :position, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, uniqueness: { scope: :quest }
  validates :delay, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
