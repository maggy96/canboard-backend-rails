class Board < ApplicationRecord
  validates :title, presence: true
  validates :user_id, presence: true
end
