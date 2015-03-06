class GameSerializer < ActiveModel::Serializer
  attributes :active_player_id

  has_one   :board
  has_many  :players
end
