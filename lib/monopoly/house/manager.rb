class House::Manager
  attr_reader :houses

  def initialize(data)
    @houses = Array.wrap(data).map do |house|
      house_klass(house[:color]).new(house[:player_id])
    end
  end

  def to_hash
    @houses.map(&:to_hash)
  end

  def fee(player)
    houses_not_owned_by(player).map(&:fee).sum
  end

  def can_build?(player, color)
    houses_with_color(color).none? { |house| house.player_id != player.id } && player.can_afford?(house_klass(color).cost)
  end

  def build(player, color)
    return false unless can_build?(player, color)

    house_klass(color).new(player).tap do |house|
      houses << house
    end
  end

  def houses_with_color(color)
    houses.select { |h| h.color == color.to_s }
  end

  def houses_not_owned_by(player)
    houses.select { |h| h.player_id != player.id }
  end

  private

  def house_klass(color)
    Kernel.const_get("House::#{color.to_s.titleize}")
  end
end
