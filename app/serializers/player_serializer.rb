class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :cash, :tile_number
end
