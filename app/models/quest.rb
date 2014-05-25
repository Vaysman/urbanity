class Quest < ActiveRecord::Base
  default_scope { order(:position) }

  belongs_to :game

  validates :name, :game, presence: true
  validates :position, numericality: { only_integer: true, greater_than: 0 }, uniqueness: { scope: :game }

  def swap_position(other)
    Quest.transaction do
      pos = self.position
      self.position = other.position
      other.position = pos
      other.save(validate: false)
      save
    end
  end
end
