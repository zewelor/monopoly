class TileSerializer < ActiveModel::Serializer
  attributes :number, :type, :data

  def type
    object.type.demodulize.downcase
  end
end
