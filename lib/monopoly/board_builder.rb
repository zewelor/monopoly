class BoardBuilder
  TILES_COUNT   = 30
  TILES         = { 0 => :start , 13 => :jail }
  DEFAULT_TILE  = :street

  def self.build
    new.build
  end

  def build
    add_tiles
    board
  end

  private

  def board
    @board ||= Board.new
  end

  def add_tiles
    TILES_COUNT.times.each do |idx|
      klass = tile_klass_for(idx)
      board.tiles << klass.new(number: idx)
    end
  end

  def tiles_config_hash
    @tiles_config_hash ||= TILES.tap { |hash| hash.default = DEFAULT_TILE }
  end

  def tile_klass_for(idx)
    Tile.const_get(tiles_config_hash[idx].to_s.titleize)
  end
end
