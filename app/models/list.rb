class List < ApplicationRecord
  validates :title, presence: true
  validates :board_id, presence: true

  belongs_to :board
  has_many :cards
end
