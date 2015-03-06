class Tile < ActiveRecord::Base
  belongs_to  :board
  has_one     :game, through: :board
  has_many    :players

  validates :number, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  default_scope { order(number: :asc) }

  def on_enter(player) ; end

  def can_move?(player)
    true
  end

  def can_build?(player, item)
    false
  end
end
