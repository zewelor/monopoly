class Monopoly::Api::Game < Grape::API
  format :json

  helpers do
    def current_player
      @current_player ||= Player.find(params[:player_id])
    end

    def current_game
      @current_game ||= ::Game.find(params[:game_id])
    end
  end

  resource :game do
    params do
      requires :game_id, type: Integer
    end
    get :state do
      current_game
    end
  end
end
