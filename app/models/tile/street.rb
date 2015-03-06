class Tile::Street < Tile
  def can_build?(player, color)
    house_manager.can_build?(player, color)
  end

  def on_enter(player)
    fee = house_manager.fee(player)
    player.pay(fee)
  end

  def build_house(player, color)
    house = house_manager.build(player, color)

    if house
      save_houses
      player.pay(house.cost)
    end
  end

  private
  def save_houses
    data[:houses] = house_manager.to_hash
    save
  end

  def house_manager
    @house_manager ||= House::Manager.new(data[:houses])
  end
end
