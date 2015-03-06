class House
  attr_reader :player_id

  def initialize(player_id)
    @player_id = player_id
  end

  def fee
    self.class.fee
  end

  def self.fee
    cost * 2
  end

  def cost
    self.class.cost
  end

  def self.cost
    self::COST
  end

  def color
    self.class.to_s.demodulize.downcase
  end

  def to_hash
    { player_id: player_id, color: color }
  end
end
