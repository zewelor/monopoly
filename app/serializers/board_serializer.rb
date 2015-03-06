class BoardSerializer < ActiveModel::Serializer
  has_many :tiles, serializer: TileSerializer
end
