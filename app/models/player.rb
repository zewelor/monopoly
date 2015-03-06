class Player < ActiveRecord::Base
  START_CASH = 1000

  belongs_to :tile
  belongs_to :game

  before_validation :setup_default_attributes, on: :create

  validates :name, presence: true

  delegate :number, to: :tile, prefix: true

  def self.find_opponent(player)
    where(game: nil, updated_at: 6.seconds.ago..Time.now).where.not(id: player.id).sample
  end

  def move(to)
    update_attribute(:tile, to)
    to.on_enter(self)
  end

  def build_house(color)
    tile.build_house(self, color)
  end

  def can_afford?(amount)
    cash >= amount
  end

  def can_move?
    tile.can_move?(self)
  end

  def pay(amount)
    decrement!(:cash, amount.to_i)
  end

  private
  def setup_default_attributes
    require 'securerandom'

    p self

    self.name = SecureRandom.urlsafe_base64(8)
    self.cash = START_CASH
  end
end
