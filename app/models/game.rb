class Game < ActiveRecord::Base
  include AASM

  has_one     :board
  has_many    :players
  has_many    :tiles, through: :board
  belongs_to  :active_player, class_name: 'Player'

  enum state: %w(waiting running finished)

  after_create :setup_board

  aasm column: :state do
    state :waiting, initial: true
    state :running
    state :finished

    event :start do
      transitions from: :waiting, to: :running, guard: :players_set?
    end
  end

  def move_player(player, tile_number)
    return false if player != active_player

    player.move(tiles[tile_number])
  end

  private

  def players_set?
    players.size == 2
  end

  def setup_board
    self.board = BoardBuilder.build
  end
end
