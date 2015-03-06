class StartGameService
  def self.start(*players)
    Game.create.tap do |game|
      setup_players(game, players)

      game.active_player  = game.players.sample
      game.start
      game.save
    end
  end

  def self.setup_players(game, players)
    players.each do |p|
      p.update_attributes(game: game, tile: game.tiles.first)
    end
  end
end
