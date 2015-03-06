class Tile::Jail < Tile
  JAIL_TURNS = 3

  def on_enter(player)
    data[player.id] = JAIL_TURNS
  end

  def can_move?(player)
    !data.key?(player.id)
  end

  # callbacks
  def turn_end
    data.each { |_, turns_left| turns_left.to_i.prev }.delete_if { |_, v| v.zero? }
  end
end
