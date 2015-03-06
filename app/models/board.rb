class Board < ActiveRecord::Base
  belongs_to  :game
  has_many    :tiles

  validates :game, presence: true

  def tiles_count
    tiles.count
  end
end
