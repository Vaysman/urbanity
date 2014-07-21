class Answer < ActiveRecord::Base
  belongs_to :quest

  validates :text, presence: true
  validates :points, numericality: { only_integer: true, greater_than: 0 }
end
