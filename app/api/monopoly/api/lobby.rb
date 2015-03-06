class Monopoly::Api::Lobby < Grape::API
  format :json

  helpers do
    def current_player
      @current_player ||= Player.find(params[:id])
    end
  end

  resource :lobby do
    post :register do
      { id: Player.create.id }
    end

    params do
      requires :id, type: Integer
    end
    post :new_game do
      current_player.touch

      game_id = if current_player.game_id.present?
                  current_player.game_id
                else
                  opponent = Player.find_opponent(current_player)

                  if opponent.present?
                    StartGameService.start(current_player, opponent).id
                  else
                    0
                  end
                end

      { game_id: game_id }
    end
  end
end
